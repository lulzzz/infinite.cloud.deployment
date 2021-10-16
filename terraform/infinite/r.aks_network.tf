module "aks_network" {
  source = "../modules/network"

  location                 = azurerm_resource_group.aks_resource_grp.location
  vnet_name                = "${local.env}-${var.vnet_name}"
  resource_group_name      = azurerm_resource_group.aks_resource_grp.name
  address_space            = var.network_address_prefix
  subnet_names             = var.network_subnet_names
  subnet_prefixes          = var.network_subnet_address_prefixes
  subnet_service_endpoints = var.subnet_service_endpoints
  depends_on               = [azurerm_resource_group.aks_resource_grp]

  tags = local.tags
}


locals {
  aks_subnet_id   = module.aks_network.vnet_subnets[0]
  appgw_subnet_id = module.aks_network.vnet_subnets[1]
}
