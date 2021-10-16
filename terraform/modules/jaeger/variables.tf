variable "operator_chart_version" {
  description = "Helm chart version of Jaeger Operator"
}


variable "jaeger_dapr_tracing_helm_chart" {
  description = "Path to local chart to install Jaeger and Dapr Tracing Configuration"
}

variable "jaeger_cr_helm_values" {
  description = "Helm values for Jaeger custom resource helm chart"
}