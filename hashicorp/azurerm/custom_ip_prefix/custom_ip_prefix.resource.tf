resource "azurerm_custom_ip_prefix" "custom_ip_prefix" {
  for_each = { for key, value in var.azurerm_custom_ip_prefix_data : key => value if value.enabled }

  # Required Arguments
  cidr                = each.value.cidr
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  commissioning_enabled         = each.value.commissioning_enabled
  internet_advertising_disabled = each.value.internet_advertising_disabled
  parent_custom_ip_prefix_id = try(coalesce(
    try(each.value.parent_custom_ip_prefix_id, null),
    try(var.azurerm_parent_custom_ip_prefix_output["${each.value.parent_custom_ip_prefix_name}"].id, null)
  ), null)
  roa_validity_end_date         = each.value.roa_validity_end_date
  tags                          = each.value.tags
  wan_validation_signed_message = each.value.wan_validation_signed_message
  zones                         = each.value.zones





  lifecycle {
    prevent_destroy = false
  }
}