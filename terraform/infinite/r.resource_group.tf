resource "azurerm_resource_group" "aks_resource_grp" {
  name     = "${local.env}-${var.resource_group_name}"
  location = var.location

  tags = local.tags
}
