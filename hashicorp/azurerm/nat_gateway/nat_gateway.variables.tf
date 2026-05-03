variable "azurerm_nat_gateway_data" {
  type = map(object({
    # Required
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    idle_timeout_in_minutes = optional(number)
    sku_name                = optional(string)
    tags                    = optional(map(string))
    zones                   = optional(set(string))
  }))
  default = {}
}
