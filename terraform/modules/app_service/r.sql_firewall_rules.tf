locals {
  app_service_ips = split(",", azurerm_app_service.admin_app_service.outbound_ip_addresses)
}
resource "azurerm_sql_firewall_rule" "firewall_rules" {
  count = length(local.app_service_ips)

  name                = "${var.name}-ip-rule-${count.index}"
  resource_group_name = var.resource_group_name
  server_name         = var.sql_server_name
  start_ip_address    = local.app_service_ips[count.index]
  end_ip_address      = local.app_service_ips[count.index]
}
