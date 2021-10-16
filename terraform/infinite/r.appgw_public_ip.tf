
# # Public Ip 
# resource "azurerm_public_ip" "appgw_public_ip" {
#   name                = "${local.env}-appgw-public-ip"
#   location            = azurerm_resource_group.aks_resource_grp.location
#   resource_group_name = azurerm_resource_group.aks_resource_grp.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
#   domain_name_label   = var.appgw_domain_name_label

#   tags = local.tags
# }