module "azure_key_vault" {

  source = "../modules/azure_key_vault"

  for_each = var.environments

  name                = "${each.key}-infaba-vault"
  location            = var.location
  tenant_id           = data.azurerm_client_config.current.tenant_id
  identity_object_id  = data.azurerm_client_config.current.object_id
  resource_group_name = azurerm_resource_group.aks_resource_grp.name

  tags = local.tags
}