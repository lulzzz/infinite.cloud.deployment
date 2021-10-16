variable "sql_server_id" {
  description = "Resource ID of the SQL Server where the database to be provisioned"
}

variable "sql_server_db_names" {
  description = "List of objects with details of the databases to be provisioned"
}

variable "storage_account_blob_endpoint" {
  description = "Blob endpoint of the Storage Account"
}

variable "storage_account_primary_secret" {
  description = "Primary Secret of Storage Account"
}

variable "tags" {

}

variable "sql_db_log_retensionIn_days" {
  description = "Log Retension in days"
}