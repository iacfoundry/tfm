# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_application_api_access_data" {
  type = map(object({
    # Required
    enabled          = bool
    api_client_id    = optional(string)
    api_client_name  = optional(string, "MicrosoftGraph")
    application_id   = optional(string)
    application_name = optional(string)

    # Optional
    role_ids    = optional(list(string))
    role_names  = optional(list(string), [])
    scope_ids   = optional(list(string))
    scope_names = optional(list(string), [])
  }))
  default = {}
}

variable "azuread_application_registration_output" {
  default = {}
}
