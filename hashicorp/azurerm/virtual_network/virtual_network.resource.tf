resource "azurerm_virtual_network" "virtual_network" {
  for_each = { for key, value in var.azurerm_virtual_network_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  address_space                  = each.value.address_space
  bgp_community                  = each.value.bgp_community
  dns_servers                    = each.value.dns_servers
  edge_zone                      = each.value.edge_zone
  flow_timeout_in_minutes        = each.value.flow_timeout_in_minutes
  private_endpoint_vnet_policies = each.value.private_endpoint_vnet_policies
  subnet                         = each.value.subnet
  tags                           = each.value.tags



  dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan != null ? [each.value.ddos_protection_plan] : []
    content {
      # Required Arguments
      enable = ddos_protection_plan.value.enable
      id     = ddos_protection_plan.value.id

    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []
    content {
      # Required Arguments
      enforcement = encryption.value.enforcement

    }
  }

  dynamic "ip_address_pool" {
    for_each = each.value.ip_address_pool != null ? [each.value.ip_address_pool] : []
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
