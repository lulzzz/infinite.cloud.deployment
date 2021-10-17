# module "admin_app_service" {
#   source = "../modules/app_service"

#   for_each = var.environments

#   name                = "${each.key}-infinite-admin"
#   resource_group_name = azurerm_resource_group.aks_resource_grp.name
#   location            = azurerm_resource_group.aks_resource_grp.location
#   sql_server_name     = module.azure_sql_databases[each.key].sql_server_name
#   dot_net_version     = "v4.0"

#   app_settings = {
#     "INF.AssetAdmin"           = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/AssetAdmin/#/auth"
#     "INF.BusinessPartnerAdmin" = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/BusinessPartnerAdmin/#/auth"
#     "INF.AccountService"       = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/AccountService"
#     "INF.ApplicationService"   = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/ApplicationService"
#     "INF.AbacusConfigAdmin"    = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/AbacusPortal/#/auth"
#     "INF.MasterDataAdmin"      = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/MasterdataAdmin/#/auth"
#     "INF.AdminService"         = "${each.value.enable_ssl ? "https" : "http"}://${each.value.subdomain}.${var.dns_zone_name}/AdminService"
#   }

#   connection_strings = {
#     "DtpAdminContext" : {
#       type : "SQLServer"
#       value : "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn},1433;Initial Catalog=${each.value.databases["inf_admin"].name};persist security info=true;User ID=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#     },
#     "DtpContext" : {
#       type : "SQLServer"
#       value : "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn},1433;Initial Catalog=${each.value.databases["inf_infinite"].name};persist security info=true;User ID=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#     },
#     "AssetContext" : {
#       type : "SQLServer"
#       value : "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn},1433;Initial Catalog=${each.value.databases["aba_asset"].name};persist security info=true;User ID=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#     },
#     "RetentionContext" : {
#       type : "SQLServer"
#       value : "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn},1433;Initial Catalog=${each.value.databases["inf_admin"].name};persist security info=true;User ID=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#     },
#     "BusinessPartnerContext" : {
#       type : "SQLServer"
#       value : "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn},1433;Initial Catalog=${each.value.databases["aba_business_partner"].name};persist security info=true;User ID=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
#     }
#   }

#   tags = local.tags

#   depends_on = [
#     module.azure_sql_databases
#   ]
# }
