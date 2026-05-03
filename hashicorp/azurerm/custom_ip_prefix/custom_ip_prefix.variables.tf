variable "azurerm_custom_ip_prefix_data" {
  type = map(object({
    # Required
    enabled             = bool
    cidr                = string
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    commissioning_enabled         = optional(bool)
    internet_advertising_disabled = optional(bool)
    parent_custom_ip_prefix_id    = optional(string) # Set to Optional for allowed lookup by name value
    parent_custom_ip_prefix_name  = optional(string) # Optional alias for parent_custom_ip_prefix_id
    roa_validity_end_date         = optional(string)
    tags                          = optional(map(string))
    wan_validation_signed_message = optional(string)
    zones                         = optional(set(string))
  }))
  default = {}
}
