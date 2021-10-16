
resource "azurerm_storage_account" "sql_storage_account" {
  name                     = var.sql_server_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.sql_storage_account_tier
  account_replication_type = var.sql_storage_account_replication_type

  tags = var.tags
}
