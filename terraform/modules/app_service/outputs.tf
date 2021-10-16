output "app_service_id" {
  value = azurerm_app_service.admin_app_service.id
}

output "outbound_ip_addresses" {
  value = split(",", azurerm_app_service.admin_app_service.outbound_ip_addresses)
}