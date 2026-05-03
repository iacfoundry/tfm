variable "azurerm_subnet_route_table_association_data" {
  type = map(object({
    # Required
    enabled          = bool
    route_table_id   = optional(string) # Set to Optional for allowed lookup by name value
    route_table_name = optional(string) # Optional alias for route_table_id
    subnet_id        = optional(string) # Set to Optional for allowed lookup by name value
    subnet_name      = optional(string) # Optional alias for subnet_id
  }))
  default = {}
}
