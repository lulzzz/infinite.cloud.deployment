
variable "identity_name" {
  description = "Name of the user assigned identity to be created and assigned to the pod"
}

variable "node_resource_group_name" {
  description = "Name of AKS Node pool Resource Group"
}

variable "location" {

}

variable "role_assignments" {
  type = list(any)
}

variable "helm_release_name" {
  description = "Release name for the helm service deployment"
}

variable "helm_chart_version" {
  description = "Helm chart version of AGIC to provision"
}

variable "helm_repository" {
  description = "URL of the Helm Repository"
}

variable "helm_chart_name" {
  description = "Name of the Helm Chart"
}

variable "namespace" {
  description = "Kubernetes Namespace"
  default     = ""
}

variable "create_namespace" {
  description = "Flag to create namespace in Kubernetes if it doesn't exist"
  default     = false
}

variable "helm_values_yaml_files" {
  type    = list(any)
  default = null
}

variable "set_values" {
  # type = any
  default     = null
  description = "Values to override given helm values.yaml files"
}

variable "ingress_hostname" {
  default     = ""
  description = "Hostname for the Ingress"
}

variable "tags" {

}