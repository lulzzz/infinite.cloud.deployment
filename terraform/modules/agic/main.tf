resource "azurerm_user_assigned_identity" "agic_pod_identity" {
  resource_group_name = var.node_resource_group_name
  location            = var.location
  name                = "${local.env}_inf_aba_aad_pod_identity_agic"

  tags = var.tags
}

resource "azurerm_role_assignment" "agic_pod_identity_contributor_appgw" {
  scope                = var.appgw_id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.agic_pod_identity.principal_id
}

resource "azurerm_role_assignment" "agic_pod_identity_reader_aks_rg" {
  scope                = var.appgw_public_ip_id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.agic_pod_identity.principal_id
}

resource "helm_release" "agic" {
  name             = "agic"
  repository       = "https://appgwingress.blob.core.windows.net/ingress-azure-helm-package/"
  chart            = "ingress-azure"
  version          = var.helm_chart_version
  namespace        = "agic-system"
  create_namespace = true

  depends_on = [
    azurerm_role_assignment.agic_pod_identity_contributor_appgw, azurerm_role_assignment.agic_pod_identity_reader_aks_rg
  ]

  set {
    name  = "verbosityLevel"
    value = var.verbosity_level
  }

  set {
    name  = "appgw.subscriptionId"
    value = var.subscription_id
  }

  set {
    name  = "appgw.resourceGroup"
    value = var.appgw_resource_group_name
  }

  set {
    name  = "appgw.applicationGatewayID"
    value = var.appgw_id
  }

  set {
    name  = "appgw.usePrivateIP"
    value = false
  }

  set {
    name  = "reconcilePeriodSeconds"
    value = var.reconcile_appgw_rules_interval
  }

  set {
    name  = "appgw.shared"
    value = var.is_shared
  }

  set {
    name  = "armAuth.type"
    value = "aadPodIdentity"
  }

  set {
    name  = "armAuth.identityResourceID"
    value = azurerm_user_assigned_identity.agic_pod_identity.id
  }

  set {
    name  = "armAuth.identityClientID"
    value = azurerm_user_assigned_identity.agic_pod_identity.client_id
  }

  set {
    name  = "rbac.enabled"
    value = var.is_rbac_enabled
  }
}
