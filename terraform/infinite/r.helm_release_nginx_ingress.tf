module "nginx_ingress_helm_release" {
  source = "../modules/nginx_ingress"

  chart_version = var.nginx_ingress_helm_chart_version

  values = [templatefile("../modules/nginx_ingress/values.yaml", {
    replica_count             = var.nginx_ingress_replicas,
    is_internal               = var.nginx_ingress_is_internal,
    load_balancer_ip          = var.nginx_ingress_load_balancer_ip
    ingress_public_ip_address = azurerm_public_ip.nginx_lb_pip.ip_address
  })]

  depends_on = [module.aks, module.aad_pod_identity, helm_release.certmgr_helm_rel]
}

resource "azurerm_public_ip" "nginx_lb_pip" {
  name                = "${var.aks_environment_name}-nginx-lb-pip"
  resource_group_name = module.aks.node_resource_group
  location            = module.aks.location
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = var.ingress_public_ip_domain_label
  public_ip_prefix_id = data.azurerm_public_ip_prefix.pip_prefix.id

  tags = local.tags
}

resource "azurerm_role_assignment" "nginx_lp_pip_contributor_to_aks_identity" {
  scope                = azurerm_public_ip.nginx_lb_pip.id
  role_definition_name = "Contributor"
  principal_id         = module.aks.system_assigned_identity.0.principal_id
}


locals {
  env_dns_a_records = flatten([
    for env_key, env in var.environments : {
      name      = env_key,
      subdomain = env.subdomain
    }
  ])

  dns_a_records = concat(local.env_dns_a_records, var.install_argocd ? [{ name : "argocd", subdomain : "${var.aks_environment_name}.argocd" }] : [])
}
resource "azurerm_dns_a_record" "env_dns_a_record" {
  for_each = { for rec in local.dns_a_records : rec.name => rec }

  provider = azurerm.infinite_global_subscription

  name                = each.value.subdomain
  zone_name           = data.azurerm_dns_zone.dns_zone.name
  resource_group_name = data.azurerm_dns_zone.dns_zone.resource_group_name
  ttl                 = 3600
  target_resource_id  = azurerm_public_ip.nginx_lb_pip.id

  tags = local.tags
}
