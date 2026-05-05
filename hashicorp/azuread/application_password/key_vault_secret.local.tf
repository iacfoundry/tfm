# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
locals {
  key_vault_secret_defaults = {
    tags            = {}
    content_type    = null
    not_before_date = null
    expiration_date = null
  }

  merged_key_vault_secret_data = {
    for key, data in var.azuread_application_password_data : key => merge(
      local.key_vault_secret_defaults,
      data,
      {
        key_vault_id   = try(data.key_vault_id, null)
        key_vault_name = try(data.key_vault_name, null)
        name           = data.secret_name
        value          = azuread_application_password.application_password[key].value
      }
    ) if(data.key_vault_id != null) || (data.key_vault_name != null) && data.enabled
  }
}
