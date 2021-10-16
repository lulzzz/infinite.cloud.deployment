resource "azurerm_storage_container" "storagecontainer_eh_processing" {
  for_each = { for eh in var.eventhub_list : eh.name => eh }

  name                  = "${each.value.env_code}-${each.value.eh_code}-eps"
  storage_account_name  = azurerm_storage_account.storageaccount_eh_processing.name
  container_access_type = "private"
}