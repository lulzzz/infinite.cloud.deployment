
resource "azurerm_eventhub" "eventhub" {
  for_each = { for eh in var.eventhub_list : eh.name => eh }

  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.eventhub_ns.name
  resource_group_name = var.resource_group_name
  partition_count     = each.value.partition_count
  message_retention   = each.value.message_retention
}
