resource "azurerm_public_ip" "public_ip" {
  for_each = { for key, value in var.azurerm_public_ip_data : key => value if value.enabled }

  # Required Arguments
  allocation_method   = each.value.allocation_method
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  ddos_protection_mode = each.value.ddos_protection_mode
  ddos_protection_plan_id = try(coalesce(
    try(each.value.ddos_protection_plan_id, null),
    try(var.azurerm_ddos_protection_plan_output["${each.value.ddos_protection_plan_name}"].id, null)
  ), null)
  domain_name_label       = each.value.domain_name_label
  domain_name_label_scope = each.value.domain_name_label_scope
  edge_zone               = each.value.edge_zone
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
  ip_tags                 = each.value.ip_tags
  ip_version              = each.value.ip_version
  public_ip_prefix_id = try(coalesce(
    try(each.value.public_ip_prefix_id, null),
    try(var.azurerm_public_ip_prefix_output["${each.value.public_ip_prefix_name}"].id, null)
  ), null)
  reverse_fqdn = each.value.reverse_fqdn
  sku          = each.value.sku
  sku_tier     = each.value.sku_tier
  tags         = each.value.tags
  zones        = each.value.zones





  lifecycle {
    prevent_destroy = false
  }
}