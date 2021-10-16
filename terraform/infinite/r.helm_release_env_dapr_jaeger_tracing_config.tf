resource "helm_release" "env_ns_dapr_jaeger_tracing_config_helm_rel" {
  for_each = var.environments

  name             = "jaeger-dapr-tracing-config"
  chart            = "./helm_charts/jaeger-dapr-tracing-config"
  namespace        = each.key
  create_namespace = true

  depends_on = [
    module.dapr_control_plane
  ]
}

resource "helm_release" "nginx_dapr_jaeger_tracing_config_helm_rel" {
  name             = "jaeger-dapr-tracing-config"
  chart            = "./helm_charts/jaeger-dapr-tracing-config"
  namespace        = "nginx-ingress-system"
  create_namespace = true

  depends_on = [
    module.dapr_control_plane
  ]
}