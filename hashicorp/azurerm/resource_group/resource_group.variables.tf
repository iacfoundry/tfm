variable "azurerm_resource_group_data" {
  type = map(object({
    # Required
    enabled  = bool
    location = string
    name     = string

    # Optional
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
  default = {}
}
