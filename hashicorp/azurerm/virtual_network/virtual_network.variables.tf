variable "azurerm_virtual_network_data" {
  type = map(object({
    # Required
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = optional(string) # Set to Optional for allowed lookup by name value

    # Optional
    address_space                  = optional(set(string))
    bgp_community                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    flow_timeout_in_minutes        = optional(number)
    private_endpoint_vnet_policies = optional(string)
    subnet = optional(set(object({
      address_prefixes                = list(string),
      default_outbound_access_enabled = bool,
      delegation = list(object({
        name = string,
        service_delegation = list(object({
          actions = set(string),
          name    = string
        }))
      })),
      id                                            = string,
      name                                          = string,
      private_endpoint_network_policies             = string,
      private_link_service_network_policies_enabled = bool,
      route_table_id                                = string,
      security_group                                = string,
      service_endpoint_policy_ids                   = set(string),
      service_endpoints                             = set(string)
    })))
    tags = optional(map(string))
    # Optional block: ddos_protection_plan
    ddos_protection_plan = optional(object({
      # Required
      enable = bool
      id     = string
    }))
    # Optional block: encryption
    encryption = optional(object({
      # Required
      enforcement = string
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
