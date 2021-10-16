module "gha_runners_network" {
  source = "../modules/network"

  location                 = azurerm_resource_group.gha_runners_rg.location
  vnet_name                = "${local.tf_workspace}-vnet"
  resource_group_name      = azurerm_resource_group.gha_runners_rg.name
  address_space            = var.vnet_cidr_range
  subnet_names             = local.subnet_names
  subnet_prefixes          = local.subnet_cidr_ranges
  subnet_service_endpoints = []

  tags = local.tags
}


locals {
  subnet_names       = keys(var.subnets)
  subnet_cidr_ranges = values(var.subnets)
  vm_subnet_id       = module.gha_runners_network.vnet_subnets[index(local.subnet_names, var.vm_subnet_name)]
}
