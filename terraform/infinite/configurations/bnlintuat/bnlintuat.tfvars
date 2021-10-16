aks_environment_name           = "bnlintuat"
sql_server_admin_login         = "dsc_admin"
# appgw_domain_name_label = "bnlintuat-infinite"
# appgw_ssl_policy        = "AppGwSslPolicy20170401S"

# appgw_resource_group_name = "bnl-infiniteabacus-appgateway-rg"
# appgw_name              = "bnl-infiniteabacus-aks-appgw"
# appgw_pip_name = "bnl-appgw-public-ip"
# appgw_vnet_name = "bnl-infiniteabacus-appgw-vnet"

k8s_cluster_admin_group_name      = "az_830_bnl-intuat-aks-sql-access"
k8s_cluster_admin_group_objectid  = "e64ea087-3c20-470f-9fb7-4112fe301abc"
vnet_name                         = "infiniteabacus-vnet"
network_address_prefix            = "10.1.0.0/16" # 10.10.16.0/21 # IMPORTANT: Currently AKS doesn't support VNETs which starts with other than 10.*.*.*
network_subnet_names              = ["aks_subnet", "appgw_subnet"]
subnet_service_endpoints          = [["Microsoft.Sql", "Microsoft.Storage"], null]
network_subnet_address_prefixes   = ["10.1.0.0/20", "10.1.16.0/20"]
k8s_service_address_cidr          = "10.1.32.0/20"
k8s_dns_service_ip                = "10.1.32.10"
k8s_enable_node_pool_auto_scaling = true
k8s_node_min_count                = 2
k8s_node_max_count                = 3
k8s_node_count                    = null
enable_abacus_flow_config_map     = true
# nginx_ingress_helm_chart_version  = "3.34.0"
nginx_ingress_replicas         = 4
nginx_ingress_is_internal      = false
nginx_ingress_load_balancer_ip = "10.1.10.10"
pip_prefix_name                = "bnl-intuat-public-ip-prefix"
nginx_appgw_probe_subdomain    = "nl.int" #Value must to be any one of the hostname used in the ingress if none of "/" allows all hosts
jaeger_ui_ingress_subdomain    = "nl.int"

environments = {
  #################################### NETHERLANDS - INT  #############################################
  "nlint" : {
    name : "Netherlands - INT",
    market_code : "NL",
    env_code : "DEV",
    subdomain: "nl.int",
    cors_allowed_urls : "http://localhost:4200,http://localhost:5200",
    sql_ad_admin_login : "az_830_bnl-intuat-aks-sql-access",
    sql_ad_admin_object_id : "e64ea087-3c20-470f-9fb7-4112fe301abc",
    enable_ssl : true,
    ssl_cert_password : "Daimler@1990",
    miles_service_address : "https://api.daimler-mobility.com/internal/customer/v1/nl",
    docgen_service_address : "https://wf.dev.econtracting.mercedes-benz.com",
    postal_code_search_api_key : "71fd2396-00e7-4cd7-8180-3ca391f868bb",
    one_api_service_address : "https://api-edc-int.corpinter.net"

    #CCS
    ccs__url : "https://test.api.corpinter.net/ccs-edc/api/v1",
    ccs_apikey : "c452d642-df87-42da-89ca-1d3889a55bbd",

    # GSSN
    gssn_url : "https://gssnplus-int.i.daimler.com/int/gssnplus-api",
    gssn_apikey : "44f50321-4694-48f2-a581-a3d050d3b469",
    gssn_model_url : "/api/v1/outlets/search?page=0&pageSize=50",

    #VMDS
    vmds_url : "https://test.api.corpinter.net/vmds/int/vehicles/v4/NL/nl",
    vmds_apikey : "c452d642-df87-42da-89ca-1d3889a55bbd",
    vmds_model_url : "https://test.api.corpinter.net/vmds/int/vehicles/v4/NL/nl/content/models",

    #VX    
    vx_base_url : "https://vdzvx-int.apac.bg.corpintra.net/rest",
    vx_username : "test-application",
    vx_password : "T3stPa$$w0rd!123",

    #FCS    
    fcs_base_url : "https://fcs-test.daimler-mobility.com",
    fcs_api_key : "c452d642-df87-42da-89ca-1d3889a55bbd",

    #OCAPI
    ocapi_jwt_token : "45DcdbEvwWA6IyUa,4OgCaHKbWsqonrRHeLONHiWBWzz1nJ0c",
    ocapi_jwt_refresh_interval : "2",
    ocapi_unauthorized_callers : "pos",
    ocapi_prefix_currency_symbol : "true",

    #FlowEtl
    etl_inf_userid : "aba_flow_robot_admin",
    etl_inf_password : "Dtp@@2022",
    inf_userid : "rudi_admin",
    inf_password : "BOInfAdmin",
    ocapi_inf_userid : "ocapipos_admin",
    ocapi_inf_password : "BOOcapiAdmin",

    #ICEPRO
    ice_pro_base_url : "https://intp-ice.fs.mercedes-benz.com/icerest/ocapirator/v1",
    ice_pro_is_unauthz : "true",

    #OCAPI Settings
    ocapisettings_prefixcurrencysymbol : true,
    ocapisettings_calculationpath : "/Ocapi/v3/calculations",
    ocapisettings_reverseproxyurl : "https://intp-ice.fs.mercedes-benz.com/icerest/onecalc/v3/nl/calculations",

    databases : {
      "aba_abacus_config" : {
        name : "ABA_ABACUS_CONFIG",
        skuName : null # "S1",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/ABA_ABACUS_CONFIG_NL",
        maxSize : 50,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_abacus_flow" : {
        name : "ABA_ABACUS_FLOW",
        skuName : "S1",
        create_mode : null,
        creation_source_database_id : null,
        maxSize : 50,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_asset" : {
        name : "ABA_ASSET",
        skuName : "Basic",
        create_mode : null,
        creation_source_database_id : null,
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_business_partner" : {
        name : "ABA_BUSINESSPARTNER",
        skuName : "Basic",
        create_mode : null,
        creation_source_database_id : null,
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_admin" : {
        name : "INF_ADMIN",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-sdc-dbserver/databases/INF_ADMIN",
        maxSize : 50,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_infinite" : {
        name : "INF_INFINITE",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-sdc-dbserver/databases/INF",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_customer" : {
        name : "INF_CUSTOMER",
        skuName : null # "basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-sdc-dbserver/databases/INF_CUSTOMER",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_document" : {
        name : "INF_DOCUMENT",
        skuName : null # "basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-sdc-dbserver/databases/INF_DOCUMENT",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_scheduler" : {
        name : "INF_SCHEDULER",
        skuName : "Basic",
        create_mode : null,
        creation_source_database_id : null,
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
    },

    services : {
      "abacus" : {
        ingress_path : "/AbacusService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacus/"
        database_access : {
          "aba_abacus_config" : { readonly : false, connection_string_name : "AbacusConfigContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusAdminContext" }
        },
        dapr_id : "abacus",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacus.restservice", "image.tag" : "2.1.0.132", "podAnnotations.dapr\\.io/app-id" : "abacus", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "abacusconfig" : {
        ingress_path : "/AbacusConfigService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacusconfig/"
        database_access : {
          "aba_config" : { readonly : false, connection_string_name : "AbacusConfigContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusConfigAdminContext" }
        },
        dapr_id : "abacusconfig",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusconfig.restservice", "image.tag" : "2.1.0.132", "podAnnotations.dapr\\.io/app-id" : "abacusconfig", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "abacusflow" : {
        ingress_path : "/AbacusFlowService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacus/"
        database_access : {
          "aba_abacus_flow" : { readonly : false, connection_string_name : "AbacusFlowContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusAdminContext" }
        },
        dapr_id : "abacusflow",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.restservice", "image.tag" : "2.1.0.128", "podAnnotations.dapr\\.io/app-id" : "abacusflow", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "asset" : {
        ingress_path : "/AssetService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/asset/"
        database_access : {
          "aba_asset" : { readonly : false, connection_string_name : "AssetContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AssetAdminContext" }
        },
        dapr_id : "asset",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.asset.restservice", "image.tag" : "2.1.0.85", "podAnnotations.dapr\\.io/app-id" : "asset", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "businesspartner" : {
        ingress_path : "/BusinessPartnerService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/businesspartner/"
        database_access : {
          "aba_business_partner" : { readonly : false, connection_string_name : "BusinessPartnerContext" },
          "inf_admin" : { readonly : true, connection_string_name : "BusinessPartnerAdminContext" }
        },
        dapr_id : "businesspartner",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.restservice", "image.tag" : "2.1.0.97", "podAnnotations.dapr\\.io/app-id" : "businesspartner", "healthProbeEndpoint" : "/v1/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "account" : {
        ingress_path : "/AccountService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "nlint-account",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.account.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "nlint-account", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "application" : {
        ingress_path : "/ApplicationService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/application/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "nlint-application",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.application.restservice", "image.tag" : "2.3.0.135", "podAnnotations.dapr\\.io/app-id" : "nlint-application", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : ["application"],
        eventhub_receivers : ["application"],
        eh_proc_host_storage_containers : ["application"]
      },
      "contract" : {
        ingress_path : "/ContractService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "contract",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.contract.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "contract", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "customer" : {
        ingress_path : "/CustomerService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "customer",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.customer.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "customer", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "docman" : {
        ingress_path : "/DocMgrService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "docman",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.docman.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "docman", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "lead" : {
        ingress_path : "/LeadService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/lead/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "lead",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.lead.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "lead", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "masterdata" : {
        ingress_path : "/MasterdataService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/masterdata/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "masterdata",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.masterdata.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "masterdata", "healthProbeEndpoint" : "/v1/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "quote" : {
        ingress_path : "/QuoteService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/quote/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "quote",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.quote.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "quote", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "admin" : {
        ingress_path : "/AdminService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/admin/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "admin",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.admin.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "admin", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "settings" : {
        ingress_path : "/SettingService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/settings/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "settings",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.settings.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "settings", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "social" : {
        ingress_path : "/SocialService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/social/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "social",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.social.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "social", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      }
    },
    "portals" : {
      "abacus" : {
        ingress_path : "/AbacusPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusconfig.portal", "image.tag" : "2.1.0.132" }
      },
      "abacusflow" : {
        ingress_path : "/AbacusFlowPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.portal", "image.tag" : "2.1.0.128" }
      },
      "asset" : {
        ingress_path : "/AssetAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.asset.portal", "image.tag" : "2.1.0.85" }
      },
      "businesspartner" : {
        ingress_path : "/BusinessPartnerAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.portal", "image.tag" : "2.1.0.97" }
      },
      "infinite" : {
        ingress_path : "/(.*)",
        backend_path : "/$1",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.infinite.portal", "image.tag" : "2.3.0.132" }
      },
      "masterdata" : {
        ingress_path : "/MasterdataAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.masterdata.portal", "image.tag" : "2.3.0.132" }
      },
      "admin" : {
        ingress_path : "/AdminPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.admin.portal", "image.tag" : "2.3.0.132" }
      }
    },
    "cronjobs" : {
      "aba_flow_clusterjob" : {
        name : "aba-flow-clusterjob",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.clusterjob.cli",
        image_tag : "2.1.0.128",
        docker_entrypoint : "dotnet /app/Infinite.AbacusFlow.Etl.Cli.ClusterJob.dll"
      },
      "aba_flow_translations" : {
        name : "aba-flow-translations",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.translations.cli",
        image_tag : "2.1.0.128",
        docker_entrypoint : "dotnet /app/Infinite.AbacusFlow.Etl.Cli.Translations.dll"
      },
      "aba_asset_ccs_job" : {
        name : "aba-asset-ccs-job",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.asset.ccs.etl",
        image_tag : "2.1.0.85",
        docker_entrypoint : "dotnet /app/Infinite.Asset.Etl.Cli.Ccs.dll"
      },
      "aba_bp_gssn_job" : {
        name : "aba-bp-gssn-job",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.gssn.etl",
        image_tag : "2.1.0.97",
        docker_entrypoint : "dotnet /app/Infinite.BusinessPartner.Etl.Cli.Gssn.dll"
      }
    },
    "eventhub_configs" : {
      "application" : {
        name : "application-eventhub",
        partition_count : 1,
        message_retention : 7,
        consumer_groups : {
          "application" : {
            name : "nlint-application", # this needs to match with the dapr id of the service
            user_metadata : "Application Processing EventHub (for Miles integration)",
            app_endpoint : "api/Miles/SubmitApplicationToMilesRequest"
          }
        }
      },
      "account" : {
        name : "account-eventhub",
        partition_count : 1,
        message_retention : 7,
        consumer_groups : {
          "account" : {
            name : "nlint-account", # this needs to match with the dapr id of the service
            user_metadata : "Subscribe for UserSync events",
            app_endpoint : "api/Account/SubscribeUserEvent"
          }
        }
      }
    }
  },
  #####################################################################################################

  #################################### NETHERLANDS - INT  #############################################
  "nluat" : {
    name : "Netherlands - UAT",
    market_code : "NL",
    env_code : "UAT"
    subdomain: "nl.uat",
    cors_allowed_urls : "http://localhost:4200,http://localhost:5200",
    sql_ad_admin_login : "az_830_bnl-intuat-aks-sql-access",
    sql_ad_admin_object_id : "e64ea087-3c20-470f-9fb7-4112fe301abc",
    enable_ssl : true,
    ssl_cert_password : "Daimler@1990",
    miles_service_address : "https://api.daimler-mobility.com/internal/customer/v1/nl",
    docgen_service_address : "https://wf.dev.econtracting.mercedes-benz.com",
    postal_code_search_api_key : "71fd2396-00e7-4cd7-8180-3ca391f868bb",
    one_api_service_address : "https://api-edc-int.corpinter.net"

    #CCS
    ccs__url : "https://test.api.corpinter.net/ccs-edc/api/v1",
    ccs_apikey : "c452d642-df87-42da-89ca-1d3889a55bbd",

    # GSSN
    gssn_url : "https://gssnplus-int.i.daimler.com/int/gssnplus-api",
    gssn_apikey : "44f50321-4694-48f2-a581-a3d050d3b469",
    gssn_model_url : "/api/v1/outlets/search?page=0&pageSize=50",

    #VMDS
    vmds_url : "https://test.api.corpinter.net/vmds/int/vehicles/v4/NL/nl",
    vmds_apikey : "c452d642-df87-42da-89ca-1d3889a55bbd",
    vmds_model_url : "https://test.api.corpinter.net/vmds/int/vehicles/v4/NL/nl/content/models",

    #VX    
    vx_base_url : "https://vdzvx-uat.apac.bg.corpintra.net/rest",
    vx_username : "test-application",
    vx_password : "T3stPa$$w0rd!123",

    #FCS    
    fcs_base_url : "https://fcs-test.daimler-mobility.com",
    fcs_api_key : "c452d642-df87-42da-89ca-1d3889a55bbd",

    #OCAPI
    ocapi_jwt_token : "IdwNExabwoBIPpTd,g8YrDZxLRjQwLcTmy7VKoniQmznseQUU",
    ocapi_jwt_refresh_interval : "2",
    ocapi_unauthorized_callers : "pos",
    ocapi_prefix_currency_symbol : "true",

    #FlowEtl    
    etl_inf_userid : "aba_flow_robot_admin",
    etl_inf_password : "Dtp@@2022",
    inf_userid : "rudi_admin",
    inf_password : "BOInfAdmin",
    ocapi_inf_userid : "ocapipos_admin",
    ocapi_inf_password : "BOOcapiAdmin",

    #ICEPRO    
    ice_pro_base_url : "https://intm-ice.fs.mercedes-benz.com/icerest/ocapirator/v1",
    ice_pro_is_unauthz : "true",

    #OCAPI Settings
    ocapisettings_prefixcurrencysymbol : true,
    ocapisettings_calculationpath : "/Ocapi/v3/calculations",
    ocapisettings_reverseproxyurl : "https://intm-ice.fs.mercedes-benz.com/icerest/onecalc/v3/nl/calculations",

    databases : {
      "aba_abacus_config" : {
        name : "ABA_ABACUS_CONFIG",
        skuName : null # "S1",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/ABA_ABACUS_CONFIG_NL",
        maxSize : 50,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_abacus_flow" : {
        name : "ABA_ABACUS_FLOW",
        skuName : "S1",
        create_mode : null,
        creation_source_database_id : null,
        maxSize : 50,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_asset" : {
        name : "ABA_ASSET",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_ASSET_NL",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "aba_business_partner" : {
        name : "ABA_BUSINESSPARTNER",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_BUSINESSPARTNER_NL",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_admin" : {
        name : "INF_ADMIN",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_ADMIN",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_infinite" : {
        name : "INF_INFINITE",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_customer" : {
        name : "INF_CUSTOMER",
        skuName : null # "basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_CUSTOMER",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_document" : {
        name : "INF_DOCUMENT",
        skuName : null # "basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_DOCUMENT",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
      "inf_scheduler" : {
        name : "INF_SCHEDULER",
        skuName : null # "Basic",
        create_mode : "Copy",
        creation_source_database_id : "/subscriptions/de637caa-55e2-4e84-b225-c5e83427567f/resourceGroups/dmo-sdc-infinite/providers/Microsoft.Sql/servers/infinite-nl-uat/databases/INF_SCHEDULER",
        maxSize : 2,
        zoneRedundant : false,
        storageAccountType : "LRS"
      },
    },

    services : {
      "abacus" : {
        ingress_path : "/AbacusService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacus/"
        database_access : {
          "aba_abacus_config" : { readonly : false, connection_string_name : "AbacusConfigContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusAdminContext" }
        },
        dapr_id : "abacus",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacus.restservice", "image.tag" : "2.1.0.132", "podAnnotations.dapr\\.io/app-id" : "abacus", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "abacusconfig" : {
        ingress_path : "/AbacusConfigService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacusconfig/"
        database_access : {
          "aba_config" : { readonly : false, connection_string_name : "AbacusConfigContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusConfigAdminContext" }
        },
        dapr_id : "abacusconfig",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusconfig.restservice", "image.tag" : "2.1.0.132", "podAnnotations.dapr\\.io/app-id" : "abacusconfig", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "abacusflow" : {
        ingress_path : "/AbacusFlowService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/abacus/"
        database_access : {
          "aba_abacus_flow" : { readonly : false, connection_string_name : "AbacusFlowContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AbacusAdminContext" }
        },
        dapr_id : "abacusflow",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.restservice", "image.tag" : "2.1.0.128", "podAnnotations.dapr\\.io/app-id" : "abacusflow", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "asset" : {
        ingress_path : "/AssetService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/asset/"
        database_access : {
          "aba_asset" : { readonly : false, connection_string_name : "AssetContext" },
          "inf_admin" : { readonly : true, connection_string_name : "AssetAdminContext" }
        },
        dapr_id : "asset",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.asset.restservice", "image.tag" : "2.1.0.85", "podAnnotations.dapr\\.io/app-id" : "asset", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "businesspartner" : {
        ingress_path : "/BusinessPartnerService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/businesspartner/"
        database_access : {
          "aba_business_partner" : { readonly : false, connection_string_name : "BusinessPartnerContext" },
          "inf_admin" : { readonly : true, connection_string_name : "BusinessPartnerAdminContext" }
        },
        dapr_id : "businesspartner",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.restservice", "image.tag" : "2.1.0.97", "podAnnotations.dapr\\.io/app-id" : "businesspartner", "healthProbeEndpoint" : "/v1/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "account" : {
        ingress_path : "/AccountService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "nluat-account",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.account.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "nluat-account", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "application" : {
        ingress_path : "/ApplicationService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/application/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "nluat-application",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.application.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "nluat-application", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "contract" : {
        ingress_path : "/ContractService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "contract",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.contract.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "contract", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "customer" : {
        ingress_path : "/CustomerService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "customer",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.customer.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "customer", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "docman" : {
        ingress_path : "/DocMgrService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/account/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "docman",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.docman.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "docman", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "lead" : {
        ingress_path : "/LeadService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/lead/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "lead",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.lead.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "lead", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "masterdata" : {
        ingress_path : "/MasterdataService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/masterdata/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "masterdata",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.masterdata.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "masterdata", "healthProbeEndpoint" : "/v1/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "quote" : {
        ingress_path : "/QuoteService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/quote/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "quote",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.quote.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "quote", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "admin" : {
        ingress_path : "/AdminService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/admin/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "admin",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.admin.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "admin", "healthProbeEndpoint" : "/swagger" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "settings" : {
        ingress_path : "/SettingService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/settings/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "settings",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.settings.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "settings", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      },
      "social" : {
        ingress_path : "/SocialService(/|$)(.*)",
        backend_path : "/$2" # "/v1.0/invoke/social/""healthProbeEndpoint"
        database_access : {
          "inf_admin" : { readonly : false, connection_string_name : "AdminContext" }
        },
        dapr_id : "social",
        helm_values : { "replicaCount" : "1", "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.social.restservice", "image.tag" : "2.3.0.132", "podAnnotations.dapr\\.io/app-id" : "social", "healthProbeEndpoint" : "/api/Heartbeat" },
        service_dependencies : [],
        eventhub_senders : [],
        eventhub_receivers : [],
        eh_proc_host_storage_containers : []
      }
    },
    "portals" : {
      "abacus" : {
        ingress_path : "/AbacusPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusconfig.portal", "image.tag" : "2.1.0.132" }
      },
      "abacusflow" : {
        ingress_path : "/AbacusFlowPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.portal", "image.tag" : "2.1.0.128" }
      },
      "asset" : {
        ingress_path : "/AssetAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.asset.portal", "image.tag" : "2.1.0.85" }
      },
      "businesspartner" : {
        ingress_path : "/BusinessPartnerAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.portal", "image.tag" : "2.1.0.97" }
      },
      "infinite" : {
        ingress_path : "/(.*)",
        backend_path : "/$1",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.infinite.portal", "image.tag" : "2.3.0.132" }
      },
      "masterdata" : {
        ingress_path : "/MasterdataAdmin(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.masterdata.portal", "image.tag" : "2.3.0.132" }
      },
      "admin" : {
        ingress_path : "/AdminPortal(/|$)(.*)",
        backend_path : "/$2",
        helm_values : { "image.repository" : "infiniteregistry.azurecr.io/dsc/inf.admin.portal", "image.tag" : "2.3.0.132" }
      }
    },
    "cronjobs" : {
      "aba_flow_clusterjob" : {
        name : "aba-flow-clusterjob",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.clusterjob.cli",
        image_tag : "2.1.0.128",
        docker_entrypoint : "dotnet /app/Infinite.AbacusFlow.Etl.Cli.ClusterJob.dll"
      },
      "aba_flow_translations" : {
        name : "aba-flow-translations",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.abacusflow.translations.cli",
        image_tag : "2.1.0.128",
        docker_entrypoint : "dotnet /app/Infinite.AbacusFlow.Etl.Cli.Translations.dll"
      },
      "aba_asset_ccs_job" : {
        name : "aba-asset-ccs-job",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.asset.ccs.etl",
        image_tag : "2.1.0.85",
        docker_entrypoint : "dotnet /app/Infinite.Asset.Etl.Cli.Ccs.dll"
      },
      "aba_bp_gssn_job" : {
        name : "aba-bp-gssn-job",
        cron_expression : "0 0 * * *",
        image_repository : "infiniteregistry.azurecr.io/dsc/aba.businesspartner.gssn.etl",
        image_tag : "2.1.0.97",
        docker_entrypoint : "dotnet /app/Infinite.BusinessPartner.Etl.Cli.Gssn.dll"
      }
    },
    "eventhub_configs" : {
      "application" : {
        name : "application-eventhub",
        partition_count : 1,
        message_retention : 7,
        consumer_groups : {
          "application" : {
            name : "nluat-application", # this needs to match with the dapr id of the service
            user_metadata : "Application Processing EventHub (for Miles integration)",
            app_endpoint : "api/Miles/SubmitApplicationToMilesRequest"
          }
        }
      },
      "account" : {
        name : "account-eventhub",
        partition_count : 1,
        message_retention : 7,
        consumer_groups : {
          "account" : {
            name : "nluat-account", # this needs to match with the dapr id of the service
            user_metadata : "Subscribe for UserSync events",
            app_endpoint : "api/Account/SubscribeUserEvent"
          }
        }
      }
    }
  }
  ######################################################################################################
}
