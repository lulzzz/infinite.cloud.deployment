provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias           = "infinite_global_subscription"
  subscription_id = var.infinite_global_subscription_id
  features {}
}

provider "kubernetes" {
  host                   = module.aks.host
  username               = module.aks.admin_username
  password               = module.aks.admin_password
  client_certificate     = base64decode(module.aks.admin_client_certificate)
  client_key             = base64decode(module.aks.admin_client_key)
  cluster_ca_certificate = base64decode(module.aks.admin_cluster_ca_certificate)
}

provider "helm" {

  kubernetes {
    host                   = module.aks.host
    username               = module.aks.admin_username
    password               = module.aks.admin_password
    client_certificate     = base64decode(module.aks.admin_client_certificate)
    client_key             = base64decode(module.aks.admin_client_key)
    cluster_ca_certificate = base64decode(module.aks.admin_cluster_ca_certificate)
  }
}

terraform {
  # backend "azurerm" {
  #   subscription_id      = "bc7bfc73-03d0-4d96-9ba8-5601291a0f2d"
  #   resource_group_name  = "terraform_state_rg"
  #   storage_account_name = "terraforminfinitesa"
  #   container_name       = "tf-infinite-aks-container"
  #   key                  = "terraform.tfstate"
  # }
}

data "azurerm_dns_zone" "dns_zone" {
  provider = azurerm.infinite_global_subscription

  name                = var.dns_zone_name
  resource_group_name = var.dns_resource_group_name
}

data "azurerm_public_ip_prefix" "pip_prefix" {
  name                = var.pip_prefix_name
  resource_group_name = var.pip_prefix_resource_group_name
}

data "azurerm_client_config" "current" {}

locals {
  env = terraform.workspace == "default" ? "" : terraform.workspace
}

locals {
  tags = {
    Environment = upper(local.env)
  }
}

# data "azurerm_public_ip" "appgw_pip" {
#   resource_group_name = var.appgw_resource_group_name
#   name                = var.appgw_pip_name
# }

# data "azurerm_application_gateway" "appgw" {
#   resource_group_name = var.appgw_resource_group_name
#   name                = var.appgw_name
# }

# data "azurerm_virtual_network" "appgw_vnet" {
#   resource_group_name = var.appgw_resource_group_name
#   name                = var.appgw_vnet_name
# }

# data "azuread_group" "aks_cluster_admins" {
#   display_name = var.k8s_cluster_admin_group_name
# }
