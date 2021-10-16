provider "azurerm" {
  features {}
}

locals {
  tf_workspace = terraform.workspace == "default" ? "" : terraform.workspace

  tags = {
    environment = local.tf_workspace
    # TODO: Add additional tags
  }
}

terraform {
  backend "azurerm" {
    subscription_id      = "bc7bfc73-03d0-4d96-9ba8-5601291a0f2d"
    resource_group_name  = "terraform_state_rg"
    storage_account_name = "terraforminfinitesa"
    container_name       = "tf-gha-runners-container"
    key                  = "terraform.tfstate"
  }
}

data "azurerm_client_config" "current" {}
