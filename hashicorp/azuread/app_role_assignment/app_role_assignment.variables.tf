# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_app_role_assignment_data" {
  type = map(object({
    # Required
    enabled             = bool
    app_role_id         = string
    principal_object_id = optional(string)
    principal_name      = optional(string)
    resource_object_id  = string
  }))
  default = {}
}

variable "azuread_service_principal_output" {
  default = {}
}