variable "azurerm_network_security_group_data" {
  type = map(object({
    # Required
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    security_rule = optional(set(object({
      access                                     = string,
      description                                = string,
      destination_address_prefix                 = string,
      destination_address_prefixes               = set(string),
      destination_application_security_group_ids = set(string),
      destination_port_range                     = string,
      destination_port_ranges                    = set(string),
      direction                                  = string,
      name                                       = string,
      priority                                   = number,
      protocol                                   = string,
      source_address_prefix                      = string,
      source_address_prefixes                    = set(string),
      source_application_security_group_ids      = set(string),
      source_port_range                          = string,
      source_port_ranges                         = set(string)
    })))
    tags = optional(map(string))
  }))
  default = {}
}
