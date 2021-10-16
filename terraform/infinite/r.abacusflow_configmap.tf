resource "kubernetes_config_map" "abacusflow_configmap" {

  for_each = var.enable_abacus_flow_config_map ? var.environments : {}

  metadata {
    name      = "abacusflow-config"
    namespace = each.key
  }

  depends_on = [
    module.aks,
    helm_release.helm_release_portal // To ensure the namespace is created by portal helm release
  ]

  data = {
    "OcapiAuthentication__JwtSecurityKeys"                         = each.value.ocapi_jwt_token
    "OcapiAuthentication__JwtRefreshIfExpiresInMinutes"            = each.value.ocapi_jwt_refresh_interval
    "OcapiAuthentication__UnauthorisedCallers"                     = each.value.ocapi_unauthorized_callers
    "Infinite.Credentials__EtlCredentials__userId"                 = each.value.etl_inf_userid
    "Infinite.Credentials__EtlCredentials__password"               = each.value.etl_inf_password
    "Infinite.Credentials__InfiniteCredentials__userId"            = each.value.inf_userid
    "Infinite.Credentials__InfiniteCredentials__password"          = each.value.inf_password
    "Infinite.Credentials__OcapiCredentials__userId"               = each.value.ocapi_inf_userid
    "Infinite.Credentials__OcapiCredentials__password"             = each.value.ocapi_inf_password
    "InfiniteCredentials__EtlCredentials__userId"                  = each.value.etl_inf_userid
    "InfiniteCredentials__EtlCredentials__password"                = each.value.etl_inf_password
    "InfiniteCredentials__InfiniteCredentials__userId"             = each.value.inf_userid
    "InfiniteCredentials__InfiniteCredentials__password"           = each.value.inf_password
    "InfiniteCredentials__OcapiCredentials__userId"                = each.value.ocapi_inf_userid
    "InfiniteCredentials__OcapiCredentials__password"              = each.value.ocapi_inf_password
    "ApiCredentials__FcsApiCredentials__baseUrl"                   = each.value.fcs_base_url
    "ApiCredentials__FcsApiCredentials__apiKey"                    = each.value.fcs_api_key
    "ApiCredentials__FcsApiCredentials__proxy"                     = ""
    "ApiCredentials__VxApiCredentials__baseUrl"                    = each.value.vx_base_url
    "ApiCredentials__VxApiCredentials__basicCredentials__userName" = each.value.vx_username
    "ApiCredentials__VxApiCredentials__basicCredentials__password" = each.value.vx_password
    "ApiCredentials__VxApiCredentials__proxy"                      = ""
    "ApiCredentials__IceProCredentials__baseUrl"                   = each.value.ice_pro_base_url
    "ApiCredentials__IceProCredentials__isUnauthorised"            = each.value.ice_pro_is_unauthz
    "ApiCredentials__IceProCredentials__proxy"                     = ""
    "OcapiSettings__PrefixCurrencySymbol"                          = each.value.ocapisettings_prefixcurrencysymbol
    "OcapiSettings__CalculationPath"                               = each.value.ocapisettings_calculationpath
    "OcapiSettings__ReverseProxyUrl"                               = each.value.ocapisettings_reverseproxyurl
  }
}
