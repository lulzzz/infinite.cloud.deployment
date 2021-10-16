resource "azurerm_linux_virtual_machine_scale_set" "gha_runners_vmss_b2s" {
  name                            = "${var.name}-${random_string.vmss_name_suffix.id}"
  resource_group_name             = var.resource_group_name
  location                        = var.location
  sku                             = var.sku
  instances                       = var.instances
  disable_password_authentication = var.disable_password_authentication
  admin_username                  = var.admin_username
  admin_password                  = random_password.vmss_password.result
  
  boot_diagnostics {
  }

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  custom_data = var.custom_data

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  os_disk {
    storage_account_type = var.os_disk.storage_account_type
    caching              = var.os_disk.caching
  }

  lifecycle {
    create_before_destroy = true # Hardcoded this to true as Terraform doesn't support variables in lifecycle block. this is required for GHA Runners
  }

  network_interface {
    name    = "internal-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }

  tags = var.tags
}
