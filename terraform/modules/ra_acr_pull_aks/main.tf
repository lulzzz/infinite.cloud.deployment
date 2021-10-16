terraform {
  required_providers {
     azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}
data "azurerm_container_registry" "acrs" {
  for_each = var.acr_names

  # provider            = acrsubscriptionprovider
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_role_definition" "acr_pull_role_definitions" {
  for_each = var.acr_names

  name  = "AcrPull"
  scope = data.azurerm_container_registry.acrs[each.key].id
}

resource "azurerm_role_assignment" "aks_pull_acr_role_assignments" {
  for_each = var.acr_names

  scope              = data.azurerm_container_registry.acrs[each.key].id
  role_definition_id = data.azurerm_role_definition.acr_pull_role_definitions[each.key].id
  principal_id       = var.principal_id
}
