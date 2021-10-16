resource "azurerm_storage_account" "storageaccount_eh_processing" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"

  network_rules {
    default_action             = "Allow"
    virtual_network_subnet_ids = var.storage_account_allowed_subnets
  }

  tags = var.tags
}
