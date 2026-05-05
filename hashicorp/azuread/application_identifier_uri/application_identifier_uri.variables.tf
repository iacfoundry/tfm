# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_application_identifier_uri_data" {
  type = map(object({
    # Required  
    enabled                  = bool
    application_id           = optional(string)
    identifier_uri           = optional(string)
    application_display_name = optional(string)

    # Optional  
  }))
  default = {}
}

variable "azuread_application_output" {
  default = {}
}
