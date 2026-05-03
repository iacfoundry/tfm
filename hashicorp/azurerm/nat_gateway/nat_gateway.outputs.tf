output "azurerm_nat_gateway_output" {
  value = { for key, value in azurerm_nat_gateway.nat_gateway : key => value }
}


output "azurerm_nat_gateway_output_names" {
  value = { for key, value in azurerm_nat_gateway.nat_gateway : value.name => value }
}

