resource "azurerm_subnet_network_security_group_association" "subnet_network_security_group_association" {
  for_each = { for key, value in var.azurerm_subnet_network_security_group_association_data : key => value if value.enabled }

  # Required Arguments
  network_security_group_id = coalesce(
    try(each.value.network_security_group_id, null),
    try(var.azurerm_network_security_group_output["${each.value.network_security_group_name}"].id, null)
  )
  subnet_id = coalesce(
    try(each.value.subnet_id, null),
    try(var.azurerm_subnet_output["${each.value.subnet_name}"].id, null)
  )







  lifecycle {
    prevent_destroy = false
  }
}