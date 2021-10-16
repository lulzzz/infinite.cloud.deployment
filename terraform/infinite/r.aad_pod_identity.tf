module "aad_pod_identity" {
  source = "../modules/aad_pod_identity"

  helm_chart_version     = var.helm_aad_pod_identity_version
  node_resource_group_id = data.azurerm_resource_group.aks_node_resource_group.id
  kunelet_identity_id    = module.aks.kubelet_identity[0].object_id

  depends_on = [module.aks]
}