resource "azurerm_role_assignment" "pod_role_assignment_to_resource" {
  for_each = { for key, role_assignment in var.role_assignments : key => role_assignment }

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = azurerm_user_assigned_identity.pod_identity.principal_id
}