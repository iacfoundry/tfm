variable "azurerm_public_ip_prefix_data" {
  type = map(object({
    # Required
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    custom_ip_prefix_id   = optional(string) # Set to Optional for allowed lookup by name value
    custom_ip_prefix_name = optional(string) # Optional alias for custom_ip_prefix_id
    ip_version            = optional(string)
    prefix_length         = optional(number)
    sku                   = optional(string)
    sku_tier              = optional(string)
    tags                  = optional(map(string))
    zones                 = optional(set(string))
  }))
  default = {}
}
