resource "azurerm_role_assignment" "sp_cluster_admin_aks" {
  scope                = azurerm_kubernetes_cluster.main.id
  role_definition_name = "Azure Kubernetes Service Cluster Admin Role"
  principal_id         = var.cluster_admin_sp_principal_id
}