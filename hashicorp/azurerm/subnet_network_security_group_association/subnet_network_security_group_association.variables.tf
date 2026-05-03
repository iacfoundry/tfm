variable "azurerm_subnet_network_security_group_association_data" {
  type = map(object({
    # Required
    enabled                     = bool
    network_security_group_id   = optional(string) # Set to Optional for allowed lookup by name value
    network_security_group_name = optional(string) # Optional alias for network_security_group_id
    subnet_id                   = optional(string) # Set to Optional for allowed lookup by name value
    subnet_name                 = optional(string) # Optional alias for subnet_id
  }))
  default = {}
}
