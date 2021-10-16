resource "helm_release" "argocd_helm_rel" {
  count = var.install_argocd ? 1 : 0

  name             = "argo-cd"
  chart            = "argo-cd"
  repository       = "https://argoproj.github.io/argo-helm"
  version          = var.argocd_helm_chart_version
  namespace        = "argocd"
  create_namespace = true
}

# Ingress for ArgoCD Server
resource "kubernetes_ingress" "argocd_server_ingress" {
  count = var.install_argocd ? 1 : 0

  metadata {
    name      = "argocd-server-ingress"
    namespace = "argocd"
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-passthrough" : "true"
      "kubernetes.io/tls-acme" : "true"
      "kubernetes.io/ingress.class" : "nginx"
      "cert-manager.io/cluster-issuer" : "letsencrypt"
      "nginx.ingress.kubernetes.io/backend-protocol" : "HTTPS"
    }
  }

  spec {
    backend {
      service_name = "argo-cd-argocd-server"
      service_port = "https"
    }

    rule {
      host = "${var.aks_environment_name}.argocd.${var.dns_zone_name}"

      http {
        path {
          backend {
            service_name = "argo-cd-argocd-server"
            service_port = "https"
          }

          path = "/"
        }
      }
    }

    tls {
      secret_name = "argocd-secret" # do not change, this is provided by Argo CD
      hosts       = ["${var.aks_environment_name}.argocd.${var.dns_zone_name}"]
    }
  }

  depends_on = [
    helm_release.argocd_helm_rel
  ]
}
