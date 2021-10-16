locals {
  consumer_groups = flatten([
    for eh_key, eh in var.eventhub_list : [
      for cg_key, cg in eh.consumer_groups : {
        name = cg.name,
        eh_name = eh.name,
        user_metadata = cg.user_metadata
      }
    ]
  ])
}

resource "azurerm_eventhub_consumer_group" "eventhub_consumer_group" {
  for_each = { for cg in local.consumer_groups : cg.eh_name => cg }
  
  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.eventhub_ns.name
  eventhub_name       = azurerm_eventhub.eventhub[each.value.eh_name].name
  resource_group_name = var.resource_group_name
  user_metadata       = each.value.user_metadata
}