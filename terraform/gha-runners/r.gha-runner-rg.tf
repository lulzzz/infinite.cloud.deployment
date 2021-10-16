resource "azurerm_resource_group" "gha_runners_rg" {
  name     = "${local.tf_workspace}-rg"
  location = var.region

  tags = local.tags
}
