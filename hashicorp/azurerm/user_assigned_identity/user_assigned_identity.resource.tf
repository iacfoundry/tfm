resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  for_each = { for key, value in var.azurerm_user_assigned_identity_data : key => value if value.enabled }

  # Required Arguments
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  # Optional Arguments
  isolation_scope = each.value.isolation_scope
  tags            = each.value.tags





  lifecycle {
    prevent_destroy = false
  }
}