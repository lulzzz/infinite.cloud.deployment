resource "helm_release" "jaeger_helm_rel" {
  name             = "jaeger"
  chart            = var.jaeger_dapr_tracing_helm_chart
  namespace        = "jaeger-system"
  create_namespace = true

  values = var.jaeger_cr_helm_values

  depends_on = [
    helm_release.jaeger_operator_helm_rel
  ]
}