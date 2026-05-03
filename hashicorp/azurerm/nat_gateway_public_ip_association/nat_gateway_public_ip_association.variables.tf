variable "azurerm_nat_gateway_public_ip_association_data" {
  type = map(object({
    # Required
    enabled                = bool
    nat_gateway_id         = optional(string) # Set to Optional for allowed lookup by name value
    nat_gateway_name       = optional(string) # Optional alias for nat_gateway_id
    public_ip_address_id   = optional(string) # Set to Optional for allowed lookup by name value
    public_ip_address_name = optional(string) # Optional alias for public_ip_address_id
  }))
  default = {}
}
