resource "azurerm_eventhub_namespace" "eventhub_ns" {
  name                = var.namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_tier
  capacity            = var.capacity

  tags = var.tags
}

