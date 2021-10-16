resource_group_name = "infiniteabacus-rg"
dns_zone_name       = "infinite.daimler.com"
location            = "westeurope"

enable_abacus_flow_config_map    = true
install_argocd                   = true
certmgr_chart_version            = "1.4.1"
argocd_helm_chart_version        = "3.10.0"
nginx_ingress_helm_chart_version = "3.34.0"
nginx_ingress_replicas           = 2
nginx_ingress_is_internal        = true
# nginx_ingress_load_balancer_ip = ""

# vnet_name                       = "infiniteabacus_vnet"
# network_address_prefix          = "20.0.0.0/8"
# network_subnet_names            = ["aks_subnet"]
# subnet_service_endpoints        = []
# network_subnet_address_prefixes = ["20.0.0.0/16"]
# k8s_service_address_cidr        = "21.0.0.0/16"
# k8s_dns_service_ip              = "21.0.0.20"

sql_server_name    = "infiniteabacus-sqlserver"
sql_server_version = "12.0"
# sql_server_admin_login               = ""
sql_server_storage_account_name      = "infabasqlssa"
sql_storage_account_tier             = "Standard"
sql_storage_account_replication_type = "LRS"
sql_db_log_retensionIn_days          = 7

# appgw_name              = ""
# appgw_resource_group_name = ""
# appgw_pip_name = ""
# appgw_vnet_name = ""

appgw_name              = "infiniteabacus-aks-appgw"
appgw_sku               = "Standard_v2"
appgw_tier              = "Standard_v2"
appgw_min_capacity      = 0
appgw_max_capacity      = 2
appgw_zones             = ["1"] #["1", "2","3"]
appgw_enable_http2      = true
appgw_domain_name_label = null

# k8s_cluster_admin_group_name      = ""
k8s_network_plugin                = "azure"
k8s_os_disk_size                  = 100
k8s_enable_node_pool_auto_scaling = true
k8s_node_min_count                = 1
k8s_node_max_count                = 3
k8s_node_count                    = 1
k8s_node_max_pods                 = "100"
k8s_nodes_az                      = [1, 2, 3]
k8s_prefix                        = "aks"
k8s_docker_bridge_cidr            = "170.10.0.1/16"
k8s_node_pool_name                = "nodepool"
k8s_node_type                     = "VirtualMachineScaleSets"
k8s_node_labels                   = "nodepools"

k8s_version                        = "1.21.2"
aks_tier                           = "Free"
aks_enable_log_analytics           = false
aks_log_analytics_sku              = "PerGB2018"
aks_node_size                      = "Standard_D4s_v4"
aks_enable_private_cluster         = false
aks_enable_http_app_routing_add_on = false
aks_enable_aci_connector_linux     = false

infinite_global_subscription_id = "bc7bfc73-03d0-4d96-9ba8-5601291a0f2d"
acr_names                       = { "infiniteregistry" : { name : "infiniteregistry", resource_group_name : "dmo-infinite" } }

helm_aad_pod_identity_version              = "4.1.3"
helm_agic_chart_version                    = "1.4.0"
helm_agic_verbosity_level                  = 3
helm_agic_shared                           = false
helm_agic_reconciling_interval             = 30
helm_agic_rbac_enabled                     = true
helm_dapr_chart_version                    = "v1.3.0"
helm_dapr_docker_image_version_to_override = null
helm_dapr_enable_ha                        = false
jaeger_operator_chart_version              = "2.21.0"
