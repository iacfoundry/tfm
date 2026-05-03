variable "azurerm_subnet_data" {
  type = map(object({
    # Required
    enabled              = bool
    name                 = string
    resource_group_name  = optional(string) # Set to Optional for allowed lookup by name value
    virtual_network_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    address_prefixes                              = optional(list(string))
    default_outbound_access_enabled               = optional(bool)
    private_endpoint_network_policies             = optional(string)
    private_link_service_network_policies_enabled = optional(bool)
    service_endpoint_policy_ids                   = optional(set(string))  # Set to Optional for allowed lookup by name value
    service_endpoint_policy_names                 = optional(list(string)) # Optional alias for service_endpoint_policy_ids
    service_endpoints                             = optional(set(string))
    sharing_scope                                 = optional(string)
    # Optional block: delegation
    delegation = optional(object({
      # Required
      name = string
      # Required block: service_delegation
      service_delegation = object({
        # Required
        name = string

        # Optional
        actions = optional(set(string))
      })
    }))
    # Optional block: ip_address_pool
    ip_address_pool = optional(object({
      # Required
      id                     = string
      number_of_ip_addresses = string
    }))
  }))
  default = {}
}
