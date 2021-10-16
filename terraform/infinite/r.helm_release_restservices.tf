locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a list of lists of objects.
  services = flatten([
    for env_key, env in var.environments : [
      for service_key, service in env.services : {
        env                             = env_key
        host_name                       = "${env.subdomain}.${var.dns_zone_name}"
        name                            = service_key
        path                            = service.ingress_path
        backend_path                    = service.backend_path
        helm_values                     = service.helm_values
        eventhub_senders                = service.eventhub_senders
        eventhub_receivers              = service.eventhub_receivers
        eh_proc_host_storage_containers = service.eh_proc_host_storage_containers
      }
    ]
  ])
}

module "helm_release_restservices" {
  source = "../modules/helm_release_with_pod_identity"

  for_each = {
    for service in local.services : "${service.env}-${service.name}" => service
  }

  node_resource_group_name = module.aks.node_resource_group
  location                 = var.location
  identity_name            = "${each.value.env}_inf_aba_${each.value.name}_identity_msi"
  helm_release_name        = "${each.value.name}restservice"
  helm_chart_version       = null
  helm_chart_name          = "./helm_charts/restservice" # relative to helm_release with pod identity module
  helm_repository          = "restservice"
  namespace                = each.value.env
  create_namespace         = true

  set_values = merge(each.value.helm_values, { "includeAbacusFlowConfigMap" : var.enable_abacus_flow_config_map })

  helm_values_yaml_files = [file("./helm_charts/restservice/values/default_values.yaml"), templatefile("./helm_charts/restservice/values/ingress_values.yaml", {
    backed_path_prefix = each.value.backend_path,
    host_name          = each.value.host_name,
    path               = each.value.path,
    service_name       = "${each.value.name}restservice"
  })] #, file("./helm_charts/restservice/values/${each.value.name}.yaml")]

  role_assignments = concat(
    flatten([
      for eh in each.value.eventhub_senders : {
        key                  = "${each.value.env}-${each.value.name}}-eventhub-sender-${eh}-eh"
        scope                = module.eventhubs.eventhub_ids["${each.value.env}-${eh}-eventhub"]
        role_definition_name = "Azure Event Hubs Data Sender"
      }
    ]),
    flatten([
      for eh in each.value.eventhub_receivers : {
        key                  = "${each.value.env}-${each.value.name}}-eventhub-receiver-${eh}-eh"
        scope                = module.eventhubs.eventhub_ids["${each.value.env}-${eh}-eventhub"]
        role_definition_name = "Azure Event Hubs Data Receiver"
      }
    ]),
    flatten([
      for cont in each.value.eh_proc_host_storage_containers : {
        key                  = "${each.value.env}-${each.value.name}}-eh-proc-host-${cont}-sc"
        scope                = module.eventhubs.storage_container_ids["${each.value.env}-${cont}-eventhub"]
        role_definition_name = "Storage Blob Data Contributor"
      }
    ])
  )

  tags = local.tags

  depends_on = [module.aks,
    module.aad_pod_identity,
    kubernetes_config_map.env_configmap,
    module.azure_sql_databases,
  helm_release.letsencrypt_clusterissuer_helm_rel]
}
