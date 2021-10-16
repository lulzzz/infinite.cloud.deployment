resource "azurerm_eventhub_authorization_rule" "eventhub_shared_access_policies" {
  for_each = { for eh in var.eventhub_list : eh.name => eh }

  name                = "sendlisten"
  namespace_name      = azurerm_eventhub_namespace.eventhub_ns.name
  eventhub_name       = azurerm_eventhub.eventhub[each.value.name].name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = true
  manage              = false

  depends_on = [
    azurerm_eventhub.eventhub
  ]
}