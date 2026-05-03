variable "azurerm_public_ip_data" {
  type = map(object({
    # Required
    enabled             = bool
    allocation_method   = string
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    ddos_protection_mode      = optional(string)
    ddos_protection_plan_id   = optional(string) # Set to Optional for allowed lookup by name value
    ddos_protection_plan_name = optional(string) # Optional alias for ddos_protection_plan_id
    domain_name_label         = optional(string)
    domain_name_label_scope   = optional(string)
    edge_zone                 = optional(string)
    idle_timeout_in_minutes   = optional(number)
    ip_tags                   = optional(map(string))
    ip_version                = optional(string)
    public_ip_prefix_id       = optional(string) # Set to Optional for allowed lookup by name value
    public_ip_prefix_name     = optional(string) # Optional alias for public_ip_prefix_id
    reverse_fqdn              = optional(string)
    sku                       = optional(string)
    sku_tier                  = optional(string)
    tags                      = optional(map(string))
    zones                     = optional(set(string))
  }))
  default = {}
}
