resource "azurerm_mssql_database" "sql_databases" {
  for_each = var.sql_server_db_names

  server_id                   = var.sql_server_id
  name                        = each.value.name
  sku_name                    = each.value.skuName
  max_size_gb                 = each.value.maxSize
  zone_redundant              = each.value.zoneRedundant
  storage_account_type        = each.value.storageAccountType
  create_mode                 = each.value.create_mode
  creation_source_database_id = each.value.creation_source_database_id

  tags = var.tags
}

resource "azurerm_mssql_database_extended_auditing_policy" "sql_db_ext_auditing_policys" {
  for_each = var.sql_server_db_names

  database_id                             = azurerm_mssql_database.sql_databases[each.key].id
  storage_endpoint                        = var.storage_account_blob_endpoint
  storage_account_access_key              = var.storage_account_primary_secret
  storage_account_access_key_is_secondary = true
  retention_in_days                       = var.sql_db_log_retensionIn_days
}
