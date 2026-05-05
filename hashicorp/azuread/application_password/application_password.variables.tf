# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_application_password_data" {
  type = map(object({
    # Required
    enabled          = bool
    application_id   = optional(string)
    application_name = optional(string)

    # Optional
    display_name        = optional(string)
    end_date            = optional(string)
    end_date_add_hours  = optional(number, 168)
    rotate_when_changed = optional(map(string))
    start_date          = optional(string)

    # Optional Key Vault Secret
    key_vault_id   = optional(string)
    key_vault_name = optional(string)
    secret_name    = optional(string)

    # Optional Rotation
    rotation_minutes = optional(number)
    rotation_hours   = optional(number)
    rotation_days    = optional(number)
    rotation_months  = optional(number)
    rotation_years   = optional(number)
  }))
  default = {}
}

variable "azuread_application_registration_output" {
  default = {}
}

variable "azurerm_key_vault_output" {
  default = {}
}

variable "azuread_application_output" {
  default = {}
}
