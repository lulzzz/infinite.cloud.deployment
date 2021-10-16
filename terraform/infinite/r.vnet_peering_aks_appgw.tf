# resource "azurerm_virtual_network_peering" "aks_appgw_vnet_peering" {
#   name                      = "vnet_peer_aks_appgw"
#   resource_group_name       = azurerm_resource_group.aks_resource_grp.name
#   virtual_network_name      = module.aks_network.vnet_name
#   remote_virtual_network_id = data.azurerm_virtual_network.appgw_vnet.id

#   depends_on = [
#     module.aks
#   ]
# }

# resource "azurerm_virtual_network_peering" "appgw_aks_vnet_peering" {
#   name                      = "vnet_peer_appgw_aks"
#   resource_group_name       = var.appgw_resource_group_name
#   virtual_network_name      = data.azurerm_virtual_network.appgw_vnet.name
#   remote_virtual_network_id = module.aks_network.vnet_id

#   depends_on = [
#     module.aks
#   ]
# }
