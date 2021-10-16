output "eventhub_ids" {
  value = { for key, eh in azurerm_eventhub.eventhub : key => eh.id }
}

output "storage_container_ids" {
  value = { for key, cont in azurerm_storage_container.storagecontainer_eh_processing : key => cont.resource_manager_id }
}

output "eventhub_primary_connection_strings" {
  value = { for key, policy in azurerm_eventhub_authorization_rule.eventhub_shared_access_policies : key => policy.primary_connection_string }
}

output "storage_account_primary_key" {
  value = azurerm_storage_account.storageaccount_eh_processing.primary_access_key
}