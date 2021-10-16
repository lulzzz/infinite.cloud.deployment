variable "region" {
  default = "germanywestcentral"
}

variable "vnet_cidr_range" {
  default = "10.1.0.0/16"
}

variable "subnets" {
  type = map(string)

  default = {
    vm_subnet : "10.1.0.0/24"
  }
}

variable "vm_subnet_name" {
  default = "vm_subnet"
}

variable "vmss_admin_username" {
  sensitive = true
  default   = "infiniteadmin"
}

variable "gh_org_or_repo_url" {
  description = "URL of the GitHub Organization or Repository where the runners to be registered with"
}

variable "gha_runner_app_download_url" {
  description = "URL of the GitHub Action Runner application. This URL needs to be updated to upgrade the runner application version in the future"
}

variable "gha_runner_app_downloaded_filename" {
  description = "File name of the download GHA Runner application using variable 'gha_runner_app_download_url'"
}

variable "gha_runner_reg_token_url" {
  
}

variable "gh_pat_to_get_runner_reg_token" {
  sensitive = true
}

variable "gha_runners_count" {
  default = 1
}

variable "akv_soft_delete_rentention_days" {
  default = 30
}

variable "akv_enable_purge_protection" {
  default = true
}

variable "akv_enabled_for_disk_encryption" {
  default = true
}
