variable "azurerm_route_table_data" {
  type = map(object({
    # Required
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    bgp_route_propagation_enabled = optional(bool)
    route = optional(set(object({
      address_prefix         = string,
      name                   = string,
      next_hop_in_ip_address = string,
      next_hop_type          = string
    })))
    tags = optional(map(string))
  }))
  default = {}
}
