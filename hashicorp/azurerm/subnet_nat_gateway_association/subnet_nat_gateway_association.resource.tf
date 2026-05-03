resource "azurerm_subnet_nat_gateway_association" "subnet_nat_gateway_association" {
  for_each = { for key, value in var.azurerm_subnet_nat_gateway_association_data : key => value if value.enabled }

  # Required Arguments
  nat_gateway_id = coalesce(
    try(each.value.nat_gateway_id, null),
    try(var.azurerm_nat_gateway_output["${each.value.nat_gateway_name}"].id, null)
  )
  subnet_id = coalesce(
    try(each.value.subnet_id, null),
    try(var.azurerm_subnet_output["${each.value.subnet_name}"].id, null)
  )







  lifecycle {
    prevent_destroy = false
  }
}