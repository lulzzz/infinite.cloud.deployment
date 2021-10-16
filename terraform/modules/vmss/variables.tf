variable "name" {
  description = "Name of VM Scale Set"
}

variable "resource_group_name" {

}

variable "location" {

}

variable "admin_username" {

}

variable "sku" {

}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })

  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

variable "instances" {
  default = 1
}

variable "disable_password_authentication" {
  default = true
}

variable "name_suffix_length" {
  default = 3
}

variable "custom_data" {

}

variable "os_disk" {
  type = object({
    storage_account_type = string
    caching              = string
  })

  default = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

variable "subnet_id" {

}

variable "tags" {

}
