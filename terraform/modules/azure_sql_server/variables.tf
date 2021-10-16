variable "sql_server_storage_account_name" {
  description = "Name of the Storage Account. This value to be suffix after the environment name and marketcode"
}

variable "resource_group_name" {
  description = ""
}

variable "location" {
  description = ""
}

variable "sql_storage_account_tier" {
  default     = "standard"
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot"
}

variable "sql_storage_account_replication_type" {
  default     = "LRS"
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}

variable "sql_server_name" {
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

variable "enable_ad_admin" {
  description = "Enable AD Admin in SQL Server"
  default     = false
}

variable "ad_admin_login" {
  description = "AD Admin Login ID"
}

variable "ad_admin_principal_id" {
  description = "AD Admin Principal ID"
}

variable "sql_db_log_retensionIn_days" {
  default     = "7"
  description = "Specifies the number of days to retain logs for in the storage account"
}

variable "vnet_rule_vnet_ids" {
  description = "List of VNETs to allow access to"
}

variable "firewall_rules" {
  default     = {}
  description = "List of IP Rules to whitelist access to SQL server"
}

variable "sql_server_db_names" {
  description = "List of Database names to be provisioned"
  type        = map(any)
}

variable "tags" {
  type        = map(string)
  description = "Any tags that should be present on the Virtual Network resources"
  default     = {}
}
