resource "azurerm_resource_group" "resource_group" {
  for_each = { for key, value in var.azurerm_resource_group_data : key => value if value.enabled }

  # Required Arguments
  location = each.value.location
  name     = each.value.name

  # Optional Arguments
  managed_by = each.value.managed_by
  tags       = each.value.tags





  lifecycle {
    prevent_destroy = false
  }
}