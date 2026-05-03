resource "azurerm_nat_gateway" "nat_gateway" {
  for_each = { for key, value in var.azurerm_nat_gateway_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  sku_name                = each.value.sku_name
  tags                    = each.value.tags
  zones                   = each.value.zones





  lifecycle {
    prevent_destroy = false
  }
}