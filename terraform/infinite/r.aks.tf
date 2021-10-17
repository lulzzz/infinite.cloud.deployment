module "aks" {
  source = "../modules/aks"

  name                                   = "${local.env}-infiniteabacus"
  resource_group_name                    = azurerm_resource_group.aks_resource_grp.name
  location                               = var.location
  kubernetes_version                     = var.k8s_version
  orchestrator_version                   = var.k8s_version
  prefix                                 = var.k8s_prefix
  network_plugin                         = var.k8s_network_plugin
  vnet_subnet_id                         = local.aks_subnet_id
  vnet_id                                = module.aks_network.vnet_id
  os_disk_size_gb                        = var.k8s_os_disk_size
  sku_tier                               = var.aks_tier # defaults to Free
  enable_role_based_access_control       = true
  rbac_aad_admin_group_object_ids        = [var.k8s_cluster_admin_group_objectid]
  rbac_aad_managed                       = true
  private_cluster_enabled                = var.aks_enable_private_cluster # default value
  enable_http_application_routing_add_on = var.aks_enable_http_app_routing_add_on
  enable_aci_connector_linux             = var.aks_enable_aci_connector_linux
  enable_azure_policy                    = true
  enable_kube_dashboard                  = false # AKS is no longer supports Dashboard add-on >=version1.19
  enable_auto_scaling                    = var.k8s_enable_node_pool_auto_scaling
  nodes_size                             = var.aks_node_size
  nodes_min_count                        = var.k8s_node_min_count
  nodes_max_count                        = var.k8s_node_max_count
  nodes_count                            = var.k8s_node_count # Please set `nodes_count` `null` while `enable_auto_scaling` is `true` to avoid possible `nodes_count` changes.
  nodes_max_pods                         = var.k8s_node_max_pods
  nodes_pool_name                        = var.k8s_node_pool_name
  nodes_availability_zones               = var.k8s_nodes_az
  nodes_type                             = var.k8s_node_type
  enable_log_analytics_workspace         = var.aks_enable_log_analytics
  cluster_admin_sp_principal_id          = data.azurerm_client_config.current.object_id
  aks_environment_name                   = var.aks_environment_name
  public_ip_resource_group_name          = var.public_ip_resource_group_name
  namespaces                             = keys(var.environments)

  nodes_labels = {
    "nodepool" : var.k8s_node_labels
  }

  nodes_tags = {
    "Agent" : "${var.k8s_node_labels}agent"
  }

  network_policy                 = "azure"
  net_profile_dns_service_ip     = var.k8s_dns_service_ip
  net_profile_docker_bridge_cidr = var.k8s_docker_bridge_cidr
  net_profile_service_cidr       = var.k8s_service_address_cidr

  tags = local.tags

  depends_on = [module.aks_network]
}

data "azurerm_resource_group" "aks_node_resource_group" {
  name = module.aks.node_resource_group

  depends_on = [
    module.aks
  ]
}

module "agic_pod_identity_pull_acr" {
  source = "../modules/ra_acr_pull_aks"
  providers = {
    azurerm = azurerm.infinite_global_subscription
  }

  acr_names    = var.acr_names
  principal_id = module.aks.kubelet_identity[0].object_id # module.aks.system_assigned_identity.0.principal_id

  depends_on = [
    module.aks
  ]
}
