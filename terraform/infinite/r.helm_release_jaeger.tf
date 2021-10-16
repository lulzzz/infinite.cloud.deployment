module "jaeger" {
  source = "../modules/jaeger"

  operator_chart_version = var.jaeger_operator_chart_version

  jaeger_dapr_tracing_helm_chart = "./helm_charts/jaeger-tracing"
  jaeger_cr_helm_values = [templatefile("./helm_charts/jaeger-tracing/values.yaml", {
    hostname = "${var.jaeger_ui_ingress_subdomain}.${var.dns_zone_name}"
  })]

  depends_on = [
    module.aks
  ]
}
