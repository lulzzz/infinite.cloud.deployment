variable "helm_chart_version" {
  description = "Helm chart version of AAD Pod Identity"
}

variable "node_resource_group_id" {
  description = "ID of AKS-managed Resource Group for node pool"
}

variable "kunelet_identity_id" {
  description = "Object ID of Kubelet Identity"
}

# variable "subscription_id" {
#   description = "Subscription ID of the AKS Cluster"
# }

# variable "tenant_id" {
#   description = "Tenant ID of the AKS Cluster"
# }

# variable "resource_group" {
#   description = "Resource Group Name of the AKS Cluster"
# }

# variable "msi_client_id" {
#   description = "Client ID of the user managed identity"
# }

# variable "values_yaml_file" {
#   description = "Values.yml with AAD Pod Identity Configuration"
# }
