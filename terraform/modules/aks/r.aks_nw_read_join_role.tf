resource "azurerm_role_definition" "aks_join_read_subnet_role" {
  name        = "${var.aks_environment_name}_aks_subnet_read_join"
  scope       = var.vnet_id
  description = "To read and join AKS subnet"

  permissions {
    actions = ["Microsoft.Network/virtualNetworks/subnets/read", "Microsoft.Network/virtualNetworks/subnets/join/action"]
  }

  assignable_scopes = [var.vnet_id, var.vnet_subnet_id]
}

resource "azurerm_role_assignment" "aks_identity_subnet_read_join" {
  scope              = var.vnet_id
  role_definition_id = azurerm_role_definition.aks_join_read_subnet_role.role_definition_resource_id
  # role_definition_name = "Network Contributor"
  principal_id = azurerm_kubernetes_cluster.main.identity[0].principal_id
}
