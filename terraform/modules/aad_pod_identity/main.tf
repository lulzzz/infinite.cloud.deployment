resource "azurerm_role_assignment" "kubelet_identity_mio_agic_pod_identity" {
  scope                = var.node_resource_group_id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.kunelet_identity_id
}

resource "azurerm_role_assignment" "kubelet_identity_vmc_node_pool_rg" {
  scope                = var.node_resource_group_id
  role_definition_name = "Virtual Machine Contributor"
  principal_id         = var.kunelet_identity_id
}

resource "helm_release" "aad_pod_identity" {
  name             = "aad-pod-identity"
  repository       = "https://raw.githubusercontent.com/Azure/aad-pod-identity/master/charts"
  chart            = "aad-pod-identity"
  version          = var.helm_chart_version
  namespace        = "aad-pod-identity-system"
  create_namespace = true

  depends_on = [
    azurerm_role_assignment.kubelet_identity_mio_agic_pod_identity,
    azurerm_role_assignment.kubelet_identity_vmc_node_pool_rg
  ]

  # values = [var.values_yaml_file]

  # set {
  #   name  = "adminsecret.subscriptionID"
  #   value = var.subscription_id
  # }

  # set {
  #   name  = "adminsecret.tenantID"
  #   value = var.tenant_id
  # }

  # set {
  #   name  = "adminsecret.resourceGroup"
  #   value = var.resource_group
  # }

  # set {
  #   name  = "adminsecret.userAssignedMSIClientID"
  #   value = var.msi_client_id
  # }
}
