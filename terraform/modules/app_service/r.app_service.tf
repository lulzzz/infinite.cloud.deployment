resource "azurerm_app_service" "admin_app_service" {

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id
  https_only          = true

  site_config {
    dotnet_framework_version = var.dot_net_version
    ftps_state               = "Disabled"
    scm_type                 = "LocalGit"
    always_on                = true
  }

  app_settings = var.app_settings

  dynamic "connection_string" {
    for_each = { for key, conn_str in var.connection_strings : key => conn_str }
    iterator = conn_str

    content {
      name  = conn_str.key
      type  = conn_str.value.type
      value = conn_str.value.value
    }
  }

  tags = var.tags
}
