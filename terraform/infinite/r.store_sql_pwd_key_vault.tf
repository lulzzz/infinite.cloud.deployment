resource "azurerm_key_vault_secret" "sql_server_password_vault" {
  for_each = var.environments

  key_vault_id = module.azure_key_vault[each.key].id
  name         = "SqlServerAdminPassword"
  value        = module.azure_sql_databases[each.key].sql_server_password

  tags = local.tags

  depends_on = [
    module.azure_sql_databases, module.azure_key_vault
  ]
}