resource "helm_release" "dapr" {
  name             = "dapr"
  repository       = "https://dapr.github.io/helm-charts/"
  chart            = "dapr"
  version          = var.chart_version
  namespace        = "dapr-system"
  create_namespace = true

  values = [
    var.values_yaml_file
  ]

  set {
    name  = "global.ha.enabled"
    value = var.enable_ha
  }

  dynamic "set" {
    for_each = var.docker_image_version_to_override != "" && var.docker_image_version_to_override != null ? ["Override default"] : []

    content {
      name  = "global.tag"
      value = var.docker_image_version_to_override
    }
  }
}