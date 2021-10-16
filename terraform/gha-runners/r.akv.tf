module "gha_runners_akv" {
  source = "../modules/azure_key_vault"

  name                       = "${local.tf_workspace}-akv"
  location                   = azurerm_resource_group.gha_runners_rg.location
  resource_group_name        = azurerm_resource_group.gha_runners_rg.name
  soft_delete_retention_days = 30
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  identity_object_id         = data.azurerm_client_config.current.object_id

  tags = local.tags
}
