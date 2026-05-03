output "azurerm_subnet_nat_gateway_association_output" {
  value = { for key, value in azurerm_subnet_nat_gateway_association.subnet_nat_gateway_association : key => value }
}


