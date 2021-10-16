variable "name" {
  description = "Name of the App Service"
}

variable "location" {
  description = "Location of the App Service"
}

variable "resource_group_name" {
  description = "Name of the resource group where this app service to be provisioned"
}

variable "sql_server_name" {
  description = "Name of the SQL Server to add firewall rule for App Service outbound IPs"
}

variable "dot_net_version" {
  description = ".NET version of the App Service"
}

variable "app_settings" {
  description = "Key-value pair to add app settings"
}

variable "connection_strings" {
  description = "List of Connection Strings"
  type        = map(any)
}

variable "tags" {

}
