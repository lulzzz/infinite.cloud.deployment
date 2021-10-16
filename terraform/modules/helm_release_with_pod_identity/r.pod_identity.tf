resource "azurerm_user_assigned_identity" "pod_identity" {
  resource_group_name = var.node_resource_group_name
  location            = var.location
  name                = var.identity_name

  tags = var.tags
}