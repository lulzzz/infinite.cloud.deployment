# locals {
#   backend_address_pool_name      = "${module.aks_network.vnet_name}-beap"
#   http_frontend_port_name        = "${module.aks_network.vnet_name}-http-feport"
#   https_frontend_port_name       = "${module.aks_network.vnet_name}-https-feport"
#   frontend_ip_configuration_name = "${module.aks_network.vnet_name}-feip"
#   http_setting_name              = "${module.aks_network.vnet_name}-be-htst"
#   nginx_ingress_probe_name       = "nginx-ingress-probe"
#   # http_listener_name             = "${module.aks_network.vnet_name}-httplstn"
#   # https_listener_name            = "${module.aks_network.vnet_name}-httpslstn"
#   # request_routing_rule_name      = "${module.aks_network.vnet_name}-rqrt"

#   depends_on = [module.aks_network]
# }

# locals {
#   env_values = flatten([
#     for env_key, env in var.environments : {
#       env_key                            = env_key,
#       ssl_password                       = env.ssl_cert_password,
#       domain                             = "${env.subdomain}.${var.dns_zone_name}",
#       http_listener_name                 = "${env_key}-httplstn",
#       https_listener_name                = "${env_key}-httpslstn"
#       http_request_routing_rule_name     = "${env_key}-httprqrt"
#       https_request_routing_rule_name    = "${env_key}-httpsrqrt"
#       http_to_https_redirect_config_name = "${env_key}-http-https-rc"
#       ssl_cert_name                      = "${env_key}-ssl-cert"
#     }
#   ])
# }

# resource "azurerm_application_gateway" "appgw" {
#   name                = "${local.env}-${var.appgw_name}"
#   resource_group_name = azurerm_resource_group.aks_resource_grp.name
#   location            = azurerm_resource_group.aks_resource_grp.location
#   enable_http2        = var.appgw_enable_http2

#   sku {
#     name = var.appgw_sku
#     tier = var.appgw_tier
#   }

#   autoscale_configuration {
#     min_capacity = var.appgw_min_capacity
#     max_capacity = var.appgw_max_capacity
#   }

#   gateway_ip_configuration {
#     name      = "appGatewayIpConfig"
#     subnet_id = local.appgw_subnet_id
#   }

#   frontend_port {
#     name = local.http_frontend_port_name
#     port = 80
#   }

#   frontend_port {
#     name = local.https_frontend_port_name
#     port = 443
#   }

#   frontend_ip_configuration {
#     name                 = local.frontend_ip_configuration_name
#     public_ip_address_id = azurerm_public_ip.appgw_public_ip.id
#   }

#   backend_address_pool {
#     name         = local.backend_address_pool_name
#     ip_addresses = [var.nginx_ingress_load_balancer_ip]
#   }

#   backend_http_settings {
#     name                  = local.http_setting_name
#     cookie_based_affinity = "Disabled"
#     port                  = 80
#     protocol              = "Http"
#     request_timeout       = 30
#     probe_name            = local.nginx_ingress_probe_name
#   }

#   ssl_policy {
#     policy_type = "Predefined"
#     policy_name = var.appgw_ssl_policy
#   }

#   dynamic "ssl_certificate" {
#     for_each = { for env in local.env_values : env.ssl_cert_name => env }

#     content {
#       name     = ssl_certificate.value.ssl_cert_name
#       data     = filebase64("./certs/${ssl_certificate.value.env_key}.pfx")
#       password = ssl_certificate.value.ssl_password
#     }
#   }

#   # HTTP
#   dynamic "http_listener" {
#     for_each = { for env in local.env_values : "${env.env_key}-http" => env }

#     content {
#       name                           = http_listener.value.http_listener_name
#       frontend_ip_configuration_name = local.frontend_ip_configuration_name
#       frontend_port_name             = local.http_frontend_port_name
#       host_name                      = http_listener.value.domain
#       protocol                       = "Http"
#     }
#   }

#   # HTTPS
#   dynamic "http_listener" {
#     for_each = { for env in local.env_values : "${env.env_key}-https" => env }

#     content {
#       name                           = http_listener.value.https_listener_name
#       frontend_ip_configuration_name = local.frontend_ip_configuration_name
#       frontend_port_name             = local.https_frontend_port_name
#       host_name                      = http_listener.value.domain
#       protocol                       = "Https"
#       require_sni                    = true
#       ssl_certificate_name           = http_listener.value.ssl_cert_name
#     }
#   }

#   # HTTPS
#   dynamic "request_routing_rule" {
#     for_each = { for env in local.env_values : "${env.env_key}-https" => env }

#     content {
#       name                       = request_routing_rule.value.https_request_routing_rule_name
#       rule_type                  = "Basic"
#       http_listener_name         = request_routing_rule.value.https_listener_name
#       backend_address_pool_name  = local.backend_address_pool_name
#       backend_http_settings_name = local.http_setting_name
#     }
#   }

#   dynamic "redirect_configuration" {
#     for_each = { for env in local.env_values : "${env.env_key}-http-https-rc" => env }

#     content {
#       name                 = redirect_configuration.value.http_to_https_redirect_config_name
#       redirect_type        = "Permanent"
#       target_listener_name = redirect_configuration.value.https_listener_name
#       include_path         = true
#       include_query_string = true
#     }
#   }

#   # HTTP
#   dynamic "request_routing_rule" {
#     for_each = { for env in local.env_values : "${env.env_key}-http" => env }

#     content {
#       name                        = request_routing_rule.value.http_request_routing_rule_name
#       rule_type                   = "Basic"
#       http_listener_name          = request_routing_rule.value.http_listener_name
#       redirect_configuration_name = request_routing_rule.value.http_to_https_redirect_config_name
#     }
#   }

#   probe {
#     name                = local.nginx_ingress_probe_name
#     host                = "${var.nginx_appgw_probe_subdomain}.${var.dns_zone_name}" 
#     interval            = 300
#     protocol            = "http"
#     path                = "/"
#     timeout             = 2
#     unhealthy_threshold = 5
#   }

#   // Ignore most changes as they should be managed by AKS ingress controller
#   # lifecycle {
#   #   ignore_changes = [
#   #     backend_address_pool,
#   #     backend_http_settings,
#   #     frontend_port,
#   #     http_listener,
#   #     probe,
#   #     request_routing_rule,
#   #     url_path_map,
#   #     ssl_certificate,
#   #     redirect_configuration,
#   #     autoscale_configuration,
#   #     tags["managed-by-k8s-ingress"],
#   #     tags["last-updated-by-k8s-ingress"],
#   #   ]
#   # }

#   # tags = local.tags

#   depends_on = [module.aks_network, azurerm_public_ip.appgw_public_ip]
# }
