variable "azurerm_user_assigned_identity_data" {
  type = map(object({
    # Required
    enabled = bool
    location = string
    name = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value
    
    # Optional
    isolation_scope = optional(string)
    tags = optional(map(string))
  }))
  default = {}
}
