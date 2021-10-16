module "azure_sql_databases" {
  source = "../modules/azure_sql_server"

  for_each = var.environments

  sql_server_storage_account_name      = "${each.key}${var.sql_server_storage_account_name}"
  resource_group_name                  = azurerm_resource_group.aks_resource_grp.name
  location                             = azurerm_resource_group.aks_resource_grp.location
  sql_storage_account_tier             = var.sql_storage_account_tier
  sql_storage_account_replication_type = var.sql_storage_account_replication_type
  sql_server_name                      = "${each.key}-${var.sql_server_name}"
  sql_server_version                   = var.sql_server_version
  sql_server_admin_login               = var.sql_server_admin_login
  ad_admin_login                       = each.value.sql_ad_admin_login
  ad_admin_principal_id                = each.value.sql_ad_admin_object_id
  sql_server_db_names                  = each.value.databases
  sql_db_log_retensionIn_days          = var.sql_db_log_retensionIn_days
  vnet_rule_vnet_ids                   = [local.aks_subnet_id]
  firewall_rules                       = var.sql_firewall_ip_rules

  tags = local.tags
}
