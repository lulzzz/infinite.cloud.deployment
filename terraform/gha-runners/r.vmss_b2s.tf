module "vmss_b2s" {
  source = "../modules/vmss"

  name                            = "${local.tf_workspace}-vmss-b2s"
  resource_group_name             = azurerm_resource_group.gha_runners_rg.name
  location                        = azurerm_resource_group.gha_runners_rg.location
  sku                             = "Standard_B2s"
  instances                       = var.gha_runners_count
  disable_password_authentication = false
  admin_username                  = var.vmss_admin_username
  subnet_id                       = local.vm_subnet_id

  custom_data = data.template_cloudinit_config.gha_runner_cloudint_config.rendered

  tags = local.tags
}

resource "azurerm_key_vault_secret" "vmss_b2s_admin_username" {
  name         = "vmss-b2s-admin-username"
  value        = module.vmss_b2s.admin_username
  key_vault_id = module.gha_runners_akv.id

  depends_on = [
    module.gha_runners_akv
  ]
}

resource "azurerm_key_vault_secret" "vmss_b2s_admin_password" {
  name         = "vmss-b2s-admin-password"
  value        = module.vmss_b2s.admin_password
  key_vault_id = module.gha_runners_akv.id

  depends_on = [
    module.gha_runners_akv
  ]
}

resource "azurerm_key_vault_secret" "gh_pat_to_get_runner_reg_token" {
  name         = "gh-pat-to-get-runner-reg-token"
  value        = var.gh_pat_to_get_runner_reg_token
  key_vault_id = module.gha_runners_akv.id

  depends_on = [
    module.gha_runners_akv
  ]
}

# resource "azurerm_role_assignment" "assign_vmss_reader_to_gha_token_secret" {
#   scope                = module.gha_runners_akv.id # azurerm_key_vault_secret.gh_pat_to_get_runner_reg_token.versionless_id
#   role_definition_name = "Key Vault Secrets User"
#   principal_id         = module.vmss_b2s.identity.0.principal_id
# }
