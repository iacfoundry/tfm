# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_application_registration_data" {
  type = map(object({
    # Required
    enabled      = bool
    display_name = string

    # Optional
    description                            = optional(string)
    group_membership_claims                = optional(list(string))
    homepage_url                           = optional(string)
    implicit_access_token_issuance_enabled = optional(bool)
    implicit_id_token_issuance_enabled     = optional(bool)
    logout_url                             = optional(string)
    marketing_url                          = optional(string)
    notes                                  = optional(string)
    privacy_statement_url                  = optional(string)
    requested_access_token_version         = optional(string)
    service_management_reference           = optional(string)
    sign_in_audience                       = optional(string)
    support_url                            = optional(string)
    terms_of_service_url                   = optional(string)
  }))
  default = {}
}
