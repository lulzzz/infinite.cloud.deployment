resource "helm_release" "certmgr_helm_rel" {
  name             = "cert-manager"
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = var.certmgr_chart_version
  namespace        = "cert-manager-system"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "letsencrypt_clusterissuer_helm_rel" {
  name             = "letsencrypt-clusterissuer"
  chart            = "./helm_charts/cluster-issuer"
  repository       = "cluster-issuer"
  version          = null
  namespace        = "cert-manager-system"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [helm_release.certmgr_helm_rel]
}
