resource "azurerm_subnet" "subnet" {
  for_each = { for key, value in var.azurerm_subnet_data : key => value if value.enabled }

  # Required Arguments
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name

  # Optional Arguments
  address_prefixes                              = each.value.address_prefixes
  default_outbound_access_enabled               = each.value.default_outbound_access_enabled
  private_endpoint_network_policies             = each.value.private_endpoint_network_policies
  private_link_service_network_policies_enabled = each.value.private_link_service_network_policies_enabled
  service_endpoint_policy_ids = try(coalesce(
    try(each.value.service_endpoint_policy_ids, null),
    try([for name in each.value.service_endpoint_policy_names : var.azurerm_service_endpoint_policy_output[name].id], null)
  ), null)
  service_endpoints = each.value.service_endpoints
  sharing_scope     = each.value.sharing_scope



  dynamic "delegation" {
    for_each = each.value.delegation != null ? [each.value.delegation] : []
    content {
      # Required Arguments
      name = delegation.value.name

      dynamic "service_delegation" {
        for_each = delegation.value.service_delegation
        content {
          # Required Arguments
          name = service_delegation.value.name

          # Optional Arguments
          actions = service_delegation.value.actions

        }
      }

    }
  }

  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? each.value.ip_address_pool : []
    content {
      # Required Arguments
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses

    }
  }

  lifecycle {
    prevent_destroy = false
  }
}
