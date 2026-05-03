resource "azurerm_public_ip_prefix" "public_ip_prefix" {
  for_each = { for key, value in var.azurerm_public_ip_prefix_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  custom_ip_prefix_id = try(coalesce(
    try(each.value.custom_ip_prefix_id, null),
    try(var.azurerm_custom_ip_prefix_output["${each.value.custom_ip_prefix_name}"].id, null)
  ), null)
  ip_version    = each.value.ip_version
  prefix_length = each.value.prefix_length
  sku           = each.value.sku
  sku_tier      = each.value.sku_tier
  tags          = each.value.tags
  zones         = each.value.zones





  lifecycle {
    prevent_destroy = false
  }
}