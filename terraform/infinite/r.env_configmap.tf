resource "kubernetes_config_map" "env_configmap" {

  for_each = var.environments

  metadata {
    name      = "infiniteabacus-config"
    namespace = each.key
  }

  depends_on = [
    module.aks, helm_release.helm_release_portal // To ensure the namespace is created by portal helm release
  ]

  data = {
    "AuthenticationEnabled"                                        = "true"
    "AuthenticationEncryptionKey"                                  = "A8EA3F5D0D3B1328CE9B1CBC584C42972A0D2B572C2DAB875A756C70"
    ConditionalValidations__ValidateCustomerConsents               = "true"
    ConditionalValidations__ValidateFinalSubmissionDate            = "true"
    "CorsOptions__Enable"                                          = "true"
    "CorsOptions__OriginUrl"                                       = "https://${each.value.subdomain}.${var.dns_zone_name}"
    "CorsOptions__AllowedUrls"                                     = each.value.cors_allowed_urls
    "CustomerModeSmsBody"                                          = "Your OTP for MBFS is {0}"
    "DataLoader__AllowSeedData"                                    = "false"
    "DataLoader__RunDataLoader"                                    = "false"
    "EncryptionKey"                                                = "E182DE4CD342B8A5E4D64655F1D99"
    "ESignInfinite__Key"                                           = "infiniteesign"
    "ESignInfinite__Value"                                         = "9zD(*4Ge"
    "HangfireServer__EtlCredentials__Password"                     = "Dtp@@2017"
    "HangfireServer__EtlCredentials__User"                         = "admin"
    "HangfireServer__RunAsCommandLine"                             = "true"
    "HangfireServer__CountryIDs"                                   = "29"
    "HangfireServer__Queue"                                        = "usersync"
    "Infinite.Authentication__ADDomain"                            = "apac.corpdir.net"
    "Infinite.Authentication__Enabled"                             = "true"
    "Infinite.CustomerModeSetting.CustomerModeUrl"                 = "https://${each.value.subdomain}.${var.dns_zone_name}/#/customer-upload"
    "Infinite.Encryption__EncryptionKey"                           = "E182DE4CD342B8A5E4D64655F1D99"
    # "Infinite.ServiceAddresses__AbacusServiceAddress"              = "http://localhost:3500/v1.0/invoke/${each.value.services.abacus.dapr_id}/method"
    # "Infinite.ServiceAddresses__ProductServiceAddress"             = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusconfig.dapr_id}/method"
    # "Infinite.ServiceAddresses__AbacusConfigServiceAddress"        = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusconfig.dapr_id}/method"
    # "Infinite.ServiceAddresses__AbacusFlowServiceAddress"          = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusflow.dapr_id}/method"
    # "Infinite.ServiceAddresses__AccountServiceAddress"             = "http://localhost:3500/v1.0/invoke/${each.value.services.account.dapr_id}/method"
    # "Infinite.ServiceAddresses__ApplicationServiceAddress"         = "http://localhost:3500/v1.0/invoke/${each.value.services.application.dapr_id}/method"
    # "Infinite.ServiceAddresses__ContractServiceAddress"            = "http://localhost:3500/v1.0/invoke/${each.value.services.contract.dapr_id}/method"
    # "Infinite.ServiceAddresses__AssetServiceAddress"               = "http://localhost:3500/v1.0/invoke/${each.value.services.asset.dapr_id}/method"
    # "Infinite.ServiceAddresses__BusinessPartnerServiceAddress"     = "http://localhost:3500/v1.0/invoke/${each.value.services.businesspartner.dapr_id}/method"
    # "Infinite.ServiceAddresses__CustomerServiceAddress"            = "http://localhost:3500/v1.0/invoke/${each.value.services.customer.dapr_id}/method"
    # "Infinite.ServiceAddresses__DocMgrServiceAddress"              = "http://localhost:3500/v1.0/invoke/${each.value.services.docman.dapr_id}/method"
    # "Infinite.ServiceAddresses__DocumentManagerServiceAddress"     = "http://localhost:3500/v1.0/invoke/${each.value.services.docman.dapr_id}/method"
    # "Infinite.ServiceAddresses__LeadServiceAddress"                = "http://localhost:3500/v1.0/invoke/${each.value.services.lead.dapr_id}/method"
    # "Infinite.ServiceAddresses__MasterDataServiceAddress"          = "http://localhost:3500/v1.0/invoke/${each.value.services.masterdata.dapr_id}/method"
    # "Infinite.ServiceAddresses__QuoteServiceAddress"               = "http://localhost:3500/v1.0/invoke/${each.value.services.quote.dapr_id}/method"
    # "Infinite.ServiceAddresses__SocialServiceAddress"              = "http://localhost:3500/v1.0/invoke/${each.value.services.social.dapr_id}/method"
    # "Infinite.ServiceAddresses__SettingsServiceAddress"            = "http://localhost:3500/v1.0/invoke/${each.value.services.settings.dapr_id}/method"
    # "Infinite.ServiceAddresses__ExternalApplicationServiceAddress" = "https://${each.value.subdomain}.${var.dns_zone_name}/ApplicationService/api/ExternalApplication/ConsentCallback"
    "Infinite.ServiceAddresses__OneAPIServiceAddress"              = each.value.one_api_service_address
    "Infinite.ServiceAddresses__DocGenServiceAddress"              = each.value.docgen_service_address
    "Infinite.ServiceAddresses__MilesServiceAddress"               = each.value.miles_service_address
    # "InfiniteServiceAddresses__AbacusServiceAddress"               = "http://localhost:3500/v1.0/invoke/${each.value.services.abacus.dapr_id}/method"
    # "InfiniteServiceAddresses__ProductServiceAddress"              = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusconfig.dapr_id}/method"
    # "InfiniteServiceAddresses__AbacusConfigServiceAddress"         = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusconfig.dapr_id}/method"
    # "InfiniteServiceAddresses__AbacusFlowServiceAddress"           = "http://localhost:3500/v1.0/invoke/${each.value.services.abacusflow.dapr_id}/method"
    # "InfiniteServiceAddresses__AccountServiceAddress"              = "http://localhost:3500/v1.0/invoke/${each.value.services.account.dapr_id}/method"
    # "InfiniteServiceAddresses__ApplicationServiceAddress"          = "http://localhost:3500/v1.0/invoke/${each.value.services.application.dapr_id}/method"
    # "InfiniteServiceAddresses__ContractServiceAddress"             = "http://localhost:3500/v1.0/invoke/${each.value.services.contract.dapr_id}/method"
    # "InfiniteServiceAddresses__AssetServiceAddress"                = "http://localhost:3500/v1.0/invoke/${each.value.services.asset.dapr_id}/method"
    # "InfiniteServiceAddresses__BusinessPartnerServiceAddress"      = "http://localhost:3500/v1.0/invoke/${each.value.services.businesspartner.dapr_id}/method"
    # "InfiniteServiceAddresses__CustomerServiceAddress"             = "http://localhost:3500/v1.0/invoke/${each.value.services.customer.dapr_id}/method"
    # "InfiniteServiceAddresses__DocMgrServiceAddress"               = "http://localhost:3500/v1.0/invoke/${each.value.services.docman.dapr_id}/method"
    # "InfiniteServiceAddresses__DocumentManagerServiceAddress"      = "http://localhost:3500/v1.0/invoke/${each.value.services.docman.dapr_id}/method"
    # "InfiniteServiceAddresses__LeadServiceAddress"                 = "http://localhost:3500/v1.0/invoke/${each.value.services.lead.dapr_id}/method"
    # "InfiniteServiceAddresses__MasterDataServiceAddress"           = "http://localhost:3500/v1.0/invoke/${each.value.services.masterdata.dapr_id}/method"
    # "InfiniteServiceAddresses__QuoteServiceAddress"                = "http://localhost:3500/v1.0/invoke/${each.value.services.quote.dapr_id}/method"
    # "InfiniteServiceAddresses__SocialServiceAddress"               = "http://localhost:3500/v1.0/invoke/${each.value.services.social.dapr_id}/method"
    # "InfiniteServiceAddresses__SettingsServiceAddress"             = "http://localhost:3500/v1.0/invoke/${each.value.services.settings.dapr_id}/method"
    "InfiniteServiceAddresses__ExternalApplicationServiceAddress"  = "https://${each.value.subdomain}.${var.dns_zone_name}/ApplicationService/api/ExternalApplication/ConsentCallback"
    "InfiniteServiceAddresses__OneAPIServiceAddress"               = each.value.one_api_service_address
    "InfiniteServiceAddresses__DocGenServiceAddress"               = each.value.docgen_service_address
    "InfiniteServiceAddresses__MilesServiceAddress"                = each.value.miles_service_address
    "ApiKey__PostalCodeSearch"                                     = each.value.postal_code_search_api_key
    # "Dapr__ApplicationPublishUrl"                                  = "http://localhost:3500/v1.0/publish/application-pubsub/${each.key}-${each.value.eventhub_configs["application"].name}"
    # "Dapr__UserPublishUrl"                                         = "http://localhost:3500/v1.0/publish/account-pubsub/${each.key}-${each.value.eventhub_configs["account"].name}"
    "InternalAccess__Token"                                        = "uyYvlfZbbaDeTYWgHzF8tuI01CZb0XsX"
    "Market__Code"                                                 = each.value.market_code
    "Migrations__AllowTestData"                                    = "false"
    "Migrations__RunMigration"                                     = "true"
    "PortalUrl"                                                    = "https://${each.value.subdomain}.${var.dns_zone_name}/#/"
    "SystemSettings__Environment"                                  = each.value.env_code
    "SystemSettings__MarketCode"                                   = each.value.market_code
    "ASPNETCORE_URLS"                                              = "http://*:80"
    # "ConnectionStrings__AbacusConfigContext"                       = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["aba_abacus_config"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AbacusFlowContext"                         = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["aba_abacus_flow"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__BusinessPartnerContext"                    = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["aba_business_partner"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__DtpAdminContext"                           = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AccountAdminContext"                       = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__ApplicationAdminContext"                   = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AppConfigAdminContext"                     = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__BusinessPartnerAdminContext"               = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__DocmanAdminContext"                        = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__MasterdataAdminContext"                    = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__LeadAdminContext"                          = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__QuoteAdminContext"                         = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__SettingsAdminContext"                      = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__SocialAdminContext"                        = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AbacusAdminContext"                        = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AbacusConfigAdminContext"                  = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AssetAdminContext"                         = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__CustomerAdminContext"                      = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__RetentionAdminContext"                     = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AssetContext"                              = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["aba_asset"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__AdminContext"                              = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__InfiniteAdminContext"                      = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_admin"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__JobScheduler"                              = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_scheduler"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__JobSchedulerContext"                       = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_scheduler"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__DtpContext"                                = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_infinite"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__DtpQuoteContext"                           = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_infinite"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__CustomerContext"                           = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_customer"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__InfiniteContext"                           = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_infinite"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__InfiniteQuoteContext"                      = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_infinite"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__DocumentContext"                           = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_document"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    # "ConnectionStrings__InfiniteAdminDbContext"                    = "Server=tcp:${module.azure_sql_databases[each.key].sql_server_fqdn};Initial Catalog=${each.value.databases["inf_scheduler"].name};User Id=${var.sql_server_admin_login};Password=${module.azure_sql_databases[each.key].sql_server_password};MultipleActiveResultSets=True;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;persist security info=True;Max Pool Size=200;"
    "RSA.Security__PrivateKey"                                     = "<RSAKeyValue><Modulus>tBeRn4F5f/T5txuu9nofb/HWuwy/A1CYLhSoH1KL+zcTfOqQZ9+Kc1X9+avL1FpHB1wiHoW0lU+eCAATBLn4e2OdFMrynuTqEqJOFG2PWWfhdCOIiB5Ra63deZdA6SRMBaUy1W0V3DgPmgXhJ/RP6Xyqb2qqxqCAXZNWwjP5FVPX6u20prBSyE21gzDBHsNwtq6SfSKaClYl5S9Kml4SJ5cSYzNMVgsZ974GoEqJMO6jdz4zR8RkRJGzqVSy+OOAULQCiGuJrd9sIyyLWfPcRbppQ5wxSTJljF81CCeuLK8qMeo+SIWRmjkBq6tUM8lfW2NZPxh3r9b8wlvx5MjMCQ==</Modulus><Exponent>AQAB</Exponent><P>5qCsyyFca7NW/GjeDkHnNPfcnAstBeEg7Val+JtSO46xIq6kg4O+rz4HS4r9BA8e+NPzDnP0zlRaR6X69DbOhXnUMEUq55XYwi8TR8LujiHSHLbbXHqi2gvcHH0g2WEHcP3U6Ta5CzqwuNbendkfHyHW7XvMpI86TemT72/2J2c=</P><Q>x+egMj4EXk3voL9cjBacxOIu2L03cpm0HGJX0Z1ImfSiGx6MCguvv245GV62yn8/e3rpCMQzjRJg8LbsajhNnK5AehhQLPmBYyaj1qAT2Q9Fi7mGhgdZ5ELoz5LaQbdO372XkSKD3Yh9Bn5ONyOAQ+np/N4bN3Go6NtrZk1iew8=</Q><DP>uXQi/wVIqGKCZF5/kb91CKb4A5MJFV0/eRrgQ9XCfpnz3wvIxui+AXVDsH+HjigKo9Tr8odUKEa0gkD6WD9qOvMIqfg01B0vPJdWTbJ22lxf9S8lnmwPYH+A9He6XpMjxLyY5SBYFKuRSFGgmhXqbMJtbnLK0NlL7TMS/sttiak=</DP><DQ>oq3vYxOvEGOSL5mrIeHBAEQk5YLOXbeRqEurtcyuaYN4bGNmiUJLapizZN78GDyHl+BFRjoMza/4LcxfBm39UxVHKVUh4gfF8L9gM2gf3tObwAJh5C6VS7nbphiW/0XCrTen4ZdaAm1xeVhOJHcCicIRBhRlx6/6Sk1N0HoHO6c=</DQ><InverseQ>lrQT+5z3Rebthu+FCfiqvDDZ7kYUzfV0eJvxaMKQ0fBq2BR4bEubVs6EJLdEnzNe8KeJd4cAjdDrbJppVFtktqwK0emAa4p6rsrTaspMsJdkkirDwJs8sJQ35tOgqi8YNGda1rhHkAkhDERlmtwGDptFJ4e3tR5TPImJFixtAxY=</InverseQ><D>Y4cfALLybef6Vdrjz+3gD+LslEVQD0nsQJND8sOQ/w4KJCASHIXrIyCkEuaB6GLYHFYruQiVq2rr4GoCGLuaer6rokEi4vOJ9TBjzGBcN8H0VFYK74cp4kOdQcR4qCBaL0iEFnWJ/kGxRaL4MzePLm+qVZbyuIEdUBnMedl1T/YvTwWZJLzsz2m5aRPei/OpAfjXwvrM2100L6xP0jeu/O1LwHfV7TfKZxcQVzNoA82BcmT+MxY9xDPzwmIttVNMU1D0zg5D+9EWNxgtVzBMT1I/FL2FqgyZ1667owQnaLhNvnF05noWbXoYeGrCbb8zZONVPC6n64Fnq0USO61+HQ==</D></RSAKeyValue>"
    "RSA.Security__PublicKey"                                      = "<RSAKeyValue><Modulus>tBeRn4F5f/T5txuu9nofb/HWuwy/A1CYLhSoH1KL+zcTfOqQZ9+Kc1X9+avL1FpHB1wiHoW0lU+eCAATBLn4e2OdFMrynuTqEqJOFG2PWWfhdCOIiB5Ra63deZdA6SRMBaUy1W0V3DgPmgXhJ/RP6Xyqb2qqxqCAXZNWwjP5FVPX6u20prBSyE21gzDBHsNwtq6SfSKaClYl5S9Kml4SJ5cSYzNMVgsZ974GoEqJMO6jdz4zR8RkRJGzqVSy+OOAULQCiGuJrd9sIyyLWfPcRbppQ5wxSTJljF81CCeuLK8qMeo+SIWRmjkBq6tUM8lfW2NZPxh3r9b8wlvx5MjMCQ==</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>"
    "EncryptSetting__AESKey"                                       = "aNdRgUkXp2s5v8y/B?E(H+KbPeShVmYq"
    "Infinite.Encryption__EncryptionKey"                           = "asouoxkdijfFXYdskdJ"

    #CCS
    "ApiCredentials__CcsApiCredentials__baseUrl" = each.value.ccs__url
    "ApiCredentials__CcsApiCredentials__apiKey"  = each.value.ccs_apikey
    "ApiCredentials__CcsApiCredentials__proxy"   = ""

    #VMDS
    "VMDS__url"       = each.value.vmds_url
    "VMDS__apiKey"    = each.value.vmds_apikey
    "VMDS__modelsUrl" = each.value.vmds_model_url
    "VMDS__proxy"     = ""

    #GSSN
    "GSSN__url"      = each.value.gssn_url
    "GSSN__password" = each.value.gssn_apikey
    "GSSN__url1"     = each.value.gssn_model_url
    "GSSN__proxy"    = ""
  }
}
