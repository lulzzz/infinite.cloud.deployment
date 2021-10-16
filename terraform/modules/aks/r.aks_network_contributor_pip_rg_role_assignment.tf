data "azurerm_resource_group" "reserved_pip_rg" {
  count = var.public_ip_resource_group_name == null ? 0 : 1
  name  = var.public_ip_resource_group_name
}

resource "azurerm_role_assignment" "aks_network_contributor_pip_rg_role_assignment" {
  count = var.public_ip_resource_group_name == null ? 0 : 1

  scope                = data.azurerm_resource_group.reserved_pip_rg[0].id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "aks_network_contributor_pip_rg_role_assignment1" {
  count = var.public_ip_resource_group_name == null ? 0 : 1

  scope                = data.azurerm_resource_group.reserved_pip_rg[0].id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_kubernetes_cluster.main.identity[0].principal_id
}
