resource "azurerm_route_table" "route_table" {
  for_each = { for key, value in var.azurerm_route_table_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled
  route                         = each.value.route
  tags                          = each.value.tags





  lifecycle {
    prevent_destroy = false
  }
}