resource "random_string" "vmss_name_suffix" {
  length  = var.name_suffix_length
  special = false
  lower   = true
  upper   = false
  number  = false

  keepers = {
    custom_data = var.custom_data
  }
}