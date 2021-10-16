locals {
  # flatten ensures that this local value is a flat list of objects, rather
  # than a list of lists of objects.
  portals = flatten([
    for env_key, env in var.environments : [
      for portal_key, portal in env.portals : {
        env          = env_key
        host_name    = "${env.subdomain}.${var.dns_zone_name}"
        name         = portal_key
        path         = portal.ingress_path
        backend_path = portal.backend_path
        helm_values  = portal.helm_values
      }
    ]
  ])
}

resource "helm_release" "helm_release_portal" {
  for_each = {
    for portal in local.portals : "${portal.env}-${portal.name}" => portal
  }

  name             = "${each.value.name}portal"
  chart            = "./helm_charts/portal"
  repository       = "portal"
  version          = null
  namespace        = each.value.env
  create_namespace = true

  values = [templatefile("./helm_charts/portal/values.yaml", {
    backed_path_prefix = each.value.backend_path,
    host_name          = each.value.host_name,
    path               = each.value.path,
    service_name       = "${each.value.name}portal"
  })]

  dynamic "set" {
    for_each = each.value.helm_values

    content {
      name  = set.key
      value = tostring(set.value)
    }
  }

  depends_on = [
    module.aks,
    helm_release.letsencrypt_clusterissuer_helm_rel
  ]
}
