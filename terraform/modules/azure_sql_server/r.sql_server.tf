resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_login
  administrator_login_password = random_password.sql_password.result

  azuread_administrator {
    login_username = var.ad_admin_login
    object_id      = var.ad_admin_principal_id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "blob_audit_contributor_for_sql_server" {
  scope                = azurerm_storage_account.sql_storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.sql_server.identity[0].principal_id
}

resource "azurerm_mssql_server_extended_auditing_policy" "sqlserver_ext_auditing_policy" {
  server_id                               = azurerm_mssql_server.sql_server.id
  storage_endpoint                        = azurerm_storage_account.sql_storage_account.primary_blob_endpoint
  storage_account_access_key              = azurerm_storage_account.sql_storage_account.primary_access_key
  storage_account_access_key_is_secondary = false
  retention_in_days                       = var.sql_db_log_retensionIn_days

  depends_on = [
    azurerm_role_assignment.blob_audit_contributor_for_sql_server
  ]
}
