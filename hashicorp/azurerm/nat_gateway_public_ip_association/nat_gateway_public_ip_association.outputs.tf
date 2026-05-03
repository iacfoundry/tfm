output "azurerm_nat_gateway_public_ip_association_output" {
  value = { for key, value in azurerm_nat_gateway_public_ip_association.nat_gateway_public_ip_association : key => value }
}


