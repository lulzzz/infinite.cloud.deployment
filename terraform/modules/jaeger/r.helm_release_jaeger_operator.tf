resource "helm_release" "jaeger_operator_helm_rel" {
  name             = "jaeger-operator"
  chart            = "jaeger-operator"
  repository       = "https://jaegertracing.github.io/helm-charts"
  version          = var.operator_chart_version
  namespace        = "jaeger-system"
  create_namespace = true
}
