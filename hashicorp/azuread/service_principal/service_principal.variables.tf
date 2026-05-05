# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_service_principal_data" {
  type = map(object({
    # Required
    enabled               = bool
    client_id             = optional(string)
    app_registration_name = optional(string)

    # Optional
    account_enabled               = optional(bool)
    alternative_names             = optional(list(string))
    app_role_assignment_required  = optional(bool)
    description                   = optional(string)
    login_url                     = optional(string)
    notes                         = optional(string)
    notification_email_addresses  = optional(list(string))
    owners                        = optional(list(string))
    preferred_single_sign_on_mode = optional(string)
    tags                          = optional(list(string))
    use_existing                  = optional(bool)

    # Optional Dynamic Blocks
    feature_tags = optional(object({
      custom_single_sign_on = optional(bool)
      enterprise            = optional(bool)
      gallery               = optional(bool)
      hide                  = optional(bool)
    }))
    saml_single_sign_on = optional(object({
      relay_state = optional(string)
    }))
  }))
  default = {}
}

variable "azuread_application_registration_output" {
  default = {}
}

variable "azuread_application_output" {
  default = {}
}
