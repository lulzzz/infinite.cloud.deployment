output "id" {
  value = azurerm_linux_virtual_machine_scale_set.gha_runners_vmss_b2s.id
}

output "admin_username" {
  value = azurerm_linux_virtual_machine_scale_set.gha_runners_vmss_b2s.admin_username
}

output "admin_password" {
  value = azurerm_linux_virtual_machine_scale_set.gha_runners_vmss_b2s.admin_password
}

output "identity" {
  value = azurerm_linux_virtual_machine_scale_set.gha_runners_vmss_b2s.identity
}