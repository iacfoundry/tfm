# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
module "key_vault_secret" {
  source = "../../azurerm/key_vault_secret"

  azurerm_key_vault_secret_data = local.merged_key_vault_secret_data
  azurerm_key_vault_output      = var.azurerm_key_vault_output
}
