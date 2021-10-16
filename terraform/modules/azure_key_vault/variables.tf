variable "name" {
  description = "Name of Azure Key Vault"
}

variable "location" {
  description = "Location of the Resource Group where Azure Key Vault to be provisioned"
}

variable "resource_group_name" {
  description = "Name of the Resource Group where Azure Key Vault to be provisioned"
}

variable "tenant_id" {
  description = "Tenant ID of the Subscription"
}

variable "identity_object_id" {
  description = "Object ID of the User/Service Principal/Managed Identity"
}

variable "soft_delete_retention_days" {
  default = 7
}

variable "enabled_for_disk_encryption" {
  default = true
}

variable "purge_protection_enabled" {
  default = true
}

variable "tags" {

}
