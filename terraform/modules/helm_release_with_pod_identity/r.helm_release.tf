resource "helm_release" "helm_rel" {
  name             = var.helm_release_name
  chart            = var.helm_chart_name
  repository       = var.helm_repository
  version          = var.helm_chart_version
  namespace        = var.namespace
  create_namespace = var.create_namespace
  values           = var.helm_values_yaml_files

  dynamic "set" {
    for_each = var.set_values

    content {
      name  = set.key
      value = tostring(set.value)
    }
  }

  set {
    name  = "armAuth.identityResourceID"
    value = azurerm_user_assigned_identity.pod_identity.id
  }

  set {
    name  = "armAuth.identityClientID"
    value = azurerm_user_assigned_identity.pod_identity.client_id
  }
}
