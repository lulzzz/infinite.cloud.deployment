resource "azurerm_sql_virtual_network_rule" "sql_vnet_rules" {
  for_each = { for subnet_id in var.vnet_rule_vnet_ids : subnet_id => subnet_id }

  name                = "sqlserver-vnet-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mssql_server.sql_server.name
  subnet_id           = each.key
}
