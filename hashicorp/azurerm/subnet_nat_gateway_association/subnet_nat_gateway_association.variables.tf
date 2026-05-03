variable "azurerm_subnet_nat_gateway_association_data" {
  type = map(object({
    # Required
    enabled          = bool
    nat_gateway_id   = optional(string) # Set to Optional for allowed lookup by name value
    nat_gateway_name = optional(string) # Optional alias for nat_gateway_id
    subnet_id        = optional(string) # Set to Optional for allowed lookup by name value
    subnet_name      = optional(string) # Optional alias for subnet_id
  }))
  default = {}
}
