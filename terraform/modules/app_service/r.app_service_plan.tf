resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "${var.name}-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "App"

  sku {
    tier = "Basic"
    size = "B1"
  }
}
