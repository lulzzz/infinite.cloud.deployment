aks_environment_name            = "logatest"
sql_server_admin_login          = "dsc_admin"
location                        = "southeastasia"
infinite_global_subscription_id = "6bedc7ed-8387-447d-8a6d-2e077c7edf89"
dns_zone_name                   = "loga.dev"
dns_resource_group_name         = "dns-rg"
# appgw_domain_name_label = "bnlintuat-infinite"
# appgw_ssl_policy        = "AppGwSslPolicy20170401S"

# appgw_resource_group_name = "bnl-infiniteabacus-appgateway-rg"
# appgw_name              = "bnl-infiniteabacus-aks-appgw"
# appgw_pip_name = "bnl-appgw-public-ip"
# appgw_vnet_name = "bnl-infiniteabacus-appgw-vnet"

k8s_cluster_admin_group_name      = "aks-sql-admin-group"
k8s_cluster_admin_group_objectid  = "5a657e98-0c10-4cfa-a014-e47cd1d9761b"
vnet_name                         = "infiniteabacus-vnet"
network_address_prefix            = "10.10.16.0/21" # IMPORTANT: Currently AKS doesn't support VNETs which starts with other than 10.*.*.*
network_subnet_names              = ["aks_subnet", "appgw_subnet"]
subnet_service_endpoints          = [["Microsoft.Sql", "Microsoft.Storage"], null]
network_subnet_address_prefixes   = ["10.10.16.0/22", "10.10.20.0/24"]
k8s_service_address_cidr          = "10.10.21.0/24"
k8s_dns_service_ip                = "10.10.21.10"
k8s_enable_node_pool_auto_scaling = true
k8s_node_min_count                = 1
k8s_node_max_count                = 1
k8s_node_count                    = null
enable_abacus_flow_config_map     = true
# nginx_ingress_helm_chart_version  = "3.34.0"
nginx_ingress_replicas         = 4
nginx_ingress_is_internal      = false
nginx_ingress_load_balancer_ip = "10.10.16.11"
pip_prefix_name                = "loga-pip-prefix"
nginx_appgw_probe_subdomain    = "inf.test" #Value must to be any one of the hostname used in the ingress if none of "/" allows all hosts
jaeger_ui_ingress_subdomain    = "inf.test"
acr_names                      = { "infiniteregistry" : { name : "logainf", resource_group_name : "acr-rg" } }

environments = {
  #################################### SPAIN - INT  #############################################
  "logatest" : {
    name : "Test - INT",
    market_code : "NL",
    env_code : "DEV",
    subdomain : "inf.test",
    cors_allowed_urls : "http://localhost:4200,http://localhost:5200",
    sql_ad_admin_login : "aks-sql-admin-group",
    sql_ad_admin_object_id : "5a657e98-0c10-4cfa-a014-e47cd1d9761b",
    enable_ssl : true,
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
    ocapisettings_reverseproxyurl : "https://intm-ice.fs.mercedes-benz.com/icerest/onecalc/v3/es/calculations",

    databases : {

    },

    services : {

    },
    "portals" : {

    },
    "cronjobs" : {
    },
    "eventhub_configs" : {

    }
  },
  #####################################################################################################
}
