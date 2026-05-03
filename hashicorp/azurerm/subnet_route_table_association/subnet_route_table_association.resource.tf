resource "azurerm_subnet_route_table_association" "subnet_route_table_association" {
  for_each = { for key, value in var.azurerm_subnet_route_table_association_data : key => value if value.enabled }

  # Required Arguments
  route_table_id = coalesce(
    try(each.value.route_table_id, null),
    try(var.azurerm_route_table_output["${each.value.route_table_name}"].id, null)
  )
  subnet_id = coalesce(
    try(each.value.subnet_id, null),
    try(var.azurerm_subnet_output["${each.value.subnet_name}"].id, null)
  )







  lifecycle {
    prevent_destroy = false
  }
}