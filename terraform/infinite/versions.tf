terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"

      configuration_aliases = [ azurerm.infinite_global_subscription ]
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~>2.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~>2.0"
    }
  }

  required_version = "~> 1.0"
}
