# module "agic" {
#   source = "../modules/helm_release_with_pod_identity"

#   node_resource_group_name = module.aks.node_resource_group
#   location                 = var.location
#   identity_name            = "${local.env}_inf_aba_agic_pod_identity_msi"
#   helm_release_name        = "agic"
#   helm_chart_version       = var.helm_agic_chart_version
#   helm_repository          = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
#   helm_chart_name          = "ingress-azure"
#   namespace                = "agic-system"
#   create_namespace         = true

#   role_assignments = {
#     "appgw_contibutor" : {
#       scope : azurerm_application_gateway.appgw.id,
#       role_definition_name : "Contributor"
#     },
#     "public_ip_reader" : {
#       scope : azurerm_public_ip.appgw_public_ip.id,
#       role_definition_name : "Reader"
#     }
#   }

#   set_values = {
#     "verbosityLevel" : var.helm_agic_verbosity_level,
#     "appgw.subscriptionId" : data.azurerm_client_config.current.subscription_id,
#     "appgw.resourceGroup" : azurerm_resource_group.aks_resource_grp.name,
#     "appgw.applicationGatewayID" : azurerm_application_gateway.appgw.id,
#     "appgw.usePrivateIP" : false,
#     "reconcilePeriodSeconds" : var.helm_agic_reconciling_interval,
#     "appgw.shared" : var.helm_agic_shared,
#     "armAuth.type" : "aadPodIdentity",
#     "rbac.enabled" : var.helm_agic_rbac_enabled
#   }

#   tags = local.tags

#   depends_on = [module.aks, module.aad_pod_identity] #, azurerm_virtual_network_peering.appgw_aks_vnet_peering]#, azurerm_virtual_network_peering.aks_appgw_vnet_peering]
# }
