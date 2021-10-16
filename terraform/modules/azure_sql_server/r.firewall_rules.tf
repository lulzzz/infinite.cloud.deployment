resource "azurerm_sql_firewall_rule" "firewall_rules" {
  for_each = var.firewall_rules

  name                = "${each.key}-ip-rule"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mssql_server.sql_server.name
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip

  depends_on = [
    azurerm_mssql_server.sql_server
  ]
}
