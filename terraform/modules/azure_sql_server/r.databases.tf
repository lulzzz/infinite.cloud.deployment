module "azure_sql_databases" {
  source = "../azure_sql_databases"

  sql_server_db_names            = var.sql_server_db_names
  sql_server_id                  = azurerm_mssql_server.sql_server.id
  storage_account_blob_endpoint  = azurerm_storage_account.sql_storage_account.primary_blob_endpoint
  storage_account_primary_secret = azurerm_storage_account.sql_storage_account.primary_access_key
  sql_db_log_retensionIn_days    = var.sql_db_log_retensionIn_days
  tags                           = var.tags
}