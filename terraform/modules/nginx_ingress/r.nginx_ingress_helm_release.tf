resource "helm_release" "nginx_ingress_helm_rel" {
  name             = "nginx-ingress"
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  version          = var.chart_version
  namespace        = "nginx-ingress-system"
  create_namespace = true

  values = var.values
}
