# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "azuread_group_member_data" {
  type = map(object({
    enabled                            = bool
    group_object_id                    = optional(string)
    group_name                         = optional(string)
    existing_group                     = optional(bool, false)
    member_object_id                   = optional(string)
    member_group_name                  = optional(string)
    member_user_name                   = optional(string)
    member_service_principal_name      = optional(string)
    member_user_assigned_identity_name = optional(string)
    existing_principal                 = optional(bool, false)
  }))
  default = {}
}

variable "azuread_service_principal_output" {
  default = {}
}

variable "azuread_group_output" {
  default = {}
}

variable "azuread_user_output" {
  default = {}
}

variable "azurerm_user_assigned_identity_output" {
  default = {}
}
