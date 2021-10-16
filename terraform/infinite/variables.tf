variable "environments" {
  description = "List of environments and its databases, services to be created within same the AKS cluster but isolated by namespaces and dedicated sql server for databases"
  type        = map(any)
}

variable "enable_abacus_flow_config_map" {
  description = "To enable/disable to add config map for abacus flow"
}

variable "public_ip_resource_group_name" {
  description = "Name of the resource group where Public IPs for AKS provisioned"
  default     = "reserved-public-ip-rg"
}

variable "resource_group_name" {
  description = "Resource Group Name for the Kubernetes cluster and associated resources"
}

variable "location" {
  description = "Azure Region where the infrastructure needs to be provisioned"
}

variable "vnet_name" {
  description = "Name of the Network"
}

variable "network_address_prefix" {
  description = "CIDR prefix for the Network"
}

variable "network_subnet_names" {
  description = "CIDR prefix for the subnets"
  type        = list(string)
}

variable "network_subnet_address_prefixes" {
  description = "CIDR perfixes for the subnets. To be in the same order as in the subnetNames"
  type        = list(string)
}

variable "appgw_name" {
  default     = "infinite"
  description = "Name of the Applicaiton Gateway"
}

variable "appgw_sku" {
  default     = "Standard_v2"
  description = "SKU of the Application Gateway"
}

variable "appgw_tier" {
  default     = "Standard_v2"
  description = "Tier of the Application Gateway"
}

variable "appgw_domain_name_label" {
  description = "Domain name label for the Public IP"
  default     = null
}

variable "appgw_min_capacity" {
  description = "Minimum Capacity of the Application Gateway"
}

variable "appgw_max_capacity" {
  description = "Maximum Capacity of the Application Gateway"
}

variable "appgw_zones" {
  description = "Zones where the Applicaiton Gateway nodes spread to"
  default     = ["1"] #["1", "2","3"]
}

variable "appgw_enable_http2" {
  description = "Enables HTTP2 for Backend pool"
  default     = true
}

variable "appgw_ssl_policy" {
  type        = string
  description = "SSL Policy name"
  default     = "AppGwSslPolicy20170401S" # AppGwSslPolicy20170401S is Azure predefined to set Min TLS version as TLS1.2
}

variable "k8s_service_address_cidr" {
  description = "CIDR notation IP range from which to assign service cluster IPs"
}

variable "k8s_dns_service_ip" {
  description = "IP Address for the K8S DNS Service"
}

variable "sql_server_name" {
  default     = "sqlserver"
  description = "The name of the SQL Server on which to create the database"
}

variable "sql_server_version" {
  default     = "12.0"
  description = "The version for the SQL Server"
}

variable "sql_server_admin_login" {
  description = "The administrator login name for the new server. Changing this forces a new resource to be created"
  sensitive   = true
}

variable "sql_server_storage_account_name" {
  description = "Name of the Storage Account. This value to be suffix after the environment name and marketcode"
}

variable "sql_storage_account_tier" {
  default     = "standard"
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot"
}

variable "sql_storage_account_replication_type" {
  default     = "LRS"
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}

variable "sql_db_log_retensionIn_days" {
  default     = "7"
  description = "Specifies the number of days to retain logs for in the storage account"
}

variable "sql_firewall_ip_rules" {
  default     = {}
  description = "List of IP Rules to whitelist access to SQL server"
}

variable "subnet_service_endpoints" {
  description = "List of service endpoints to enable for the subnets"
}

# variable "appgw_resource_group_name" {
#   description = "Applicatation Gateway Resource Group Name"
# }

# variable "appgw_name" {
#   description = "Name of the Application Gateway"
# }

# variable "appgw_pip_name" {
#   description = "Name of the Public IP"
# }

# variable "appgw_vnet_name" {
#   description = "Name of the Application Gateway Network"
# }

variable "k8s_version" {
  description = "Kubernetes version that needs to be provisioned"
}

variable "k8s_cluster_admin_group_name" {
  description = "Name of the Admin Group for the Kubernetes Cluster"
}

variable "k8s_cluster_admin_group_objectid" {
  description = "ObjectId of the Admin Group for the Kubernetes Cluster"
}

variable "k8s_network_plugin" {
  default     = "azure"
  description = "Network plugin to use for Kubernetes networking"
}

variable "k8s_os_disk_size" {
  default     = 20
  description = "Disk size of Kubernetes nodes in GBs"
}

variable "k8s_enable_node_pool_auto_scaling" {
  default     = false
  description = "Enable node pool autoscaling for Kubernetes Cluster"
}

variable "k8s_node_min_count" {
  description = "Minimum number of nodes in a pool"
}

variable "k8s_node_max_count" {
  description = "Maximum number of nodes in a pool"
}

variable "k8s_node_count" {
  description = "The number of Agents that should exist in the Agent Pool. Please set `agents_count` `null` while `enable_auto_scaling` is `true` to avoid possible `agents_count` changes"
}

variable "k8s_node_max_pods" {
  default     = "100"
  description = "The maximum number of pods that can run on each agent. Changing this forces a new resource to be created"
}

variable "k8s_nodes_az" {
  default     = ["1"]
  description = "A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created"
}

variable "k8s_node_pool_name" {
  default     = "nodes"
  description = "The default Azure AKS agentpool (nodepool) name"
}

variable "k8s_node_type" {
  default     = "VirtualMachineScaleSets"
  description = "The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets"
}

variable "aks_node_size" {
  description = "VM Size for the Kubernetes nodes"
}

variable "aks_environment_name" {
  description = "Environment Name"
}

variable "k8s_node_labels" {
  default     = "defaultnodepool"
  description = "A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created"
}

variable "k8s_prefix" {
  default     = "k8s"
  description = "The prefix for the resources created in the specified Azure Resource Group"
}

variable "k8s_docker_bridge_cidr" {
  description = "CIDR prefix for the Docker network bridge"
}

variable "aks_tier" {
  default     = "Free"
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
}

variable "aks_enable_log_analytics" {
  default     = false
  description = "Enable the creation of azurerm_log_analytics_workspace and azurerm_log_analytics_solution or not"
}

variable "aks_log_analytics_sku" {
  default     = "PerGB2018"
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
}

variable "aks_enable_private_cluster" {
  description = "Should this Kubernetes Cluster have its API server only exposed on internal IP addresses"
}

variable "aks_enable_http_app_routing_add_on" {
  description = "Enables/Disables AKS Add-on for Http Application Routing"
}

variable "aks_enable_aci_connector_linux" {
  description = "Enables/Disables Azure Container Instance add-on"
}

variable "acr_names" {
  default     = { "infiniteregistry" : { name : "infiniteregistry", resource_group_name : "dmo-infinite" } }
  description = "Names of the Azure Container Registries to allow pull images from AKS"
  type        = map(any)
}

variable "infinite_global_subscription_id" {
  default     = "bc7bfc73-03d0-4d96-9ba8-5601291a0f2d"
  description = "ID of the subscription where the ACR, DNS and other common resources belong to"
}

variable "dns_resource_group_name" {
  default = "dmo-infinite"
}

variable "dns_zone_name" {
  default = "infinite.daimler.com"
}

variable "pip_prefix_resource_group_name" {
  default = "reserved-public-ip-rg"
}

variable "pip_prefix_name" {
  description = "Name of the Public IP Prefix where the Public IP for AKS LoadBalancer to be created"
}

variable "helm_aad_pod_identity_version" {
  description = "Helm chart version of AAD Pod Identity"
}

variable "helm_agic_chart_version" {
  description = "Helm chart version to deploy for AGIC"
}

variable "helm_agic_verbosity_level" {
  default     = 3
  description = "Verbosity Level for Application Gateway Ingress Controller"
}

variable "helm_agic_shared" {
  default     = false
  description = "Setting appgw.shared to true will create an AzureIngressProhibitedTarget CRD"
}

variable "helm_agic_reconciling_interval" {
  default     = 30
  description = "Reconciling interval if the Application Gateway rules is different from AGIC"
}

variable "helm_agic_rbac_enabled" {
  default     = true
  description = "Enables/Disables RBAC for AGIC"
}

variable "helm_dapr_chart_version" {
  description = "Helm Chart version of Dapr"
}

variable "helm_dapr_docker_image_version_to_override" {
  description = "Docker Image version to overrider for Dapr control plane. Leave it empty if no override"
}

variable "helm_dapr_enable_ha" {
  default     = false
  description = "Enables/Disables High Availablity of the Dapr control plane"
}

variable "install_argocd" {
  default     = false
  description = "Flag to install ArgoCD"
}

variable "argocd_helm_chart_version" {
  description = "Chart version of ArgoCD"
}

variable "ingress_public_ip_domain_label" {
  default     = null
  description = "Domain Label for Ingress LoadBalander Public IP"
}

variable "nginx_ingress_helm_chart_version" {
  description = "Helm Chart Version of the NGINX Ingress Controller"
}

variable "nginx_ingress_replicas" {
  default     = 2
  description = "Number of Nginx Ingress controller to provision"
}

variable "nginx_ingress_is_internal" {
  description = "Toggle between internal and external ingress controller"
}

variable "nginx_ingress_load_balancer_ip" {
  description = "Load balancer IP for the ingress controller"
}

variable "nginx_appgw_probe_subdomain" {
  description = "Hostname to be used with Application Gateway probe to Nginx Ingress Controller. Value must to be any one of the hostname used in the ingress if none of '/' allows all hosts"
}

variable "jaeger_operator_chart_version" {
  description = "Helm chart version of Jaeger Operator"
}

variable "jaeger_ui_ingress_subdomain" {
  description = "Hostname for Jeager Ingress"
}

variable "certmgr_chart_version" {
  description = "Helm Chart version of Cert-Manager"
}
