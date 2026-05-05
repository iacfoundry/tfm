module "key_vault_secret" {
  source = "../../../hashicorp/azurerm/key_vault_secret"

  azurerm_key_vault_secret_data = local.merged_key_vault_secret_data
  azurerm_key_vault_output      = var.azurerm_key_vault_output
}
