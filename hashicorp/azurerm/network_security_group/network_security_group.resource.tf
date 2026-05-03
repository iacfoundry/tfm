resource "azurerm_network_security_group" "network_security_group" {
  for_each = { for key, value in var.azurerm_network_security_group_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  security_rule = each.value.security_rule
  tags          = each.value.tags





  lifecycle {
    prevent_destroy = false
  }
}