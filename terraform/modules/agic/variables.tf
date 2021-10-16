variable "helm_chart_version" {
  description = "Helm chart version of AGIC to provision"
}

variable "node_resource_group_name" {
  description = "Name of AKS Node pool Resource Group"
}

variable "location" {

}

variable "appgw_public_ip_id" {
  description = "ID of Applicaiton Gateway Public IP"
}

variable "verbosity_level" {
  default     = 3
  description = "Verbosity Level for Application Gateway Ingress Controller"
}

variable "subscription_id" {
  description = "Subscripiton ID of the Application Gateway"
}

variable "appgw_resource_group_name" {
  description = "Name of the Azure Resource Group in which Application Gateway was created"
}

variable "appgw_id" {
  description = "Resource ID of the Application Gateway"
}

variable "is_shared" {
  default     = true
  description = "Setting appgw.shared to true will create an AzureIngressProhibitedTarget CRD"
}

variable "reconcile_appgw_rules_interval" {
  default     = 30
  description = "Reconciling interval if the Application Gateway rules is different from AGIC"
}

variable "is_rbac_enabled" {
  default     = true
  description = "Enables/Disables RBAC for AGIC"
}

variable "tags" {

}
