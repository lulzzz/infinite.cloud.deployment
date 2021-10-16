locals {

  eventhubs = flatten([
    for env_key, env in var.environments : [
      for eh_key, eh in env.eventhub_configs : {
        env_code : env_key,
        eh_code : eh_key,
        name : "${env_key}-${eh.name}",
        partition_count : eh.partition_count,
        message_retention : eh.message_retention,
        consumer_groups : eh.consumer_groups
      }
    ]
  ])
}

module "eventhubs" {
  source = "../modules/eventhub"

  location                        = var.location
  resource_group_name             = azurerm_resource_group.aks_resource_grp.name
  namespace_name                  = "${var.aks_environment_name}-infiniteabacus-ehns"
  storage_account_name            = "${var.aks_environment_name}ehpsa"
  eventhub_list                   = local.eventhubs
  sku_tier                        = "Standard"
  capacity                        = "1"
  storage_account_allowed_subnets = [local.aks_subnet_id]

  tags = local.tags
}

resource "helm_release" "helm_rel_dapr_pubsub_component" {
  for_each = { for eh in local.eventhubs : "${eh.env_code}-${eh.eh_code}" => eh }

  name             = "${each.value.eh_code}-pubsub"
  chart            = "./helm_charts/dapr_crd"
  repository       = "dapr_crd"
  version          = null
  namespace        = each.value.env_code
  create_namespace = true

  values = [templatefile("./helm_charts/dapr_crd/eventhub_pubsub.tmpl", {
    name                      = "${each.value.eh_code}-pubsub"
    namespace                 = each.value.env_code
    eventhub_connectionstring = module.eventhubs.eventhub_primary_connection_strings[each.value.name]
    stroge_account_name       = "${var.aks_environment_name}ehpsa"
    stroge_account_key        = module.eventhubs.storage_account_primary_key
    storage_container_name    = "${each.value.env_code}-${each.value.eh_code}-eps"
  })]

  depends_on = [
    module.eventhubs
  ]
}

locals {

  consumer_groups = flatten([
    for env_key, env in var.environments : [
      for eh_key, eh in env.eventhub_configs : [
        for cg_key, cg in eh.consumer_groups : {
          env_code : env_key,
          eh_code : eh_key,
          eh_name : "${env_key}-${eh.name}",
          cg_code : cg_key,
          cg_name : cg.name,
          cg_app_endpoint : cg.app_endpoint
        }
      ]
    ]
  ])
}

resource "helm_release" "helm_rel_dapr_app_subscription" {
  for_each = { for cg in local.consumer_groups : "${cg.env_code}-${cg.eh_code}-${cg.cg_code}" => cg }

  name             = "${each.value.eh_code}-cg-${each.value.cg_code}"
  chart            = "./helm_charts/dapr_crd"
  repository       = "dapr_crd"
  version          = null
  namespace        = each.value.env_code
  create_namespace = true

  values = [templatefile("./helm_charts/dapr_crd/eventhub_subscription.tmpl", {
    name                     = "${each.value.eh_code}-cg-${each.value.cg_code}"
    namespace                = each.value.env_code
    eventhub_name            = each.value.eh_name
    subscribing_app_endpoint = each.value.cg_app_endpoint
    pubsub_name              = "${each.value.eh_code}-pubsub"
    dapr_app_id              = each.value.cg_name
  })]

  depends_on = [
    module.eventhubs, helm_release.helm_rel_dapr_pubsub_component
  ]
}
