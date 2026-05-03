output "azurerm_nat_gateway_public_ip_prefix_association_output" {
  value = { for key, value in azurerm_nat_gateway_public_ip_prefix_association.nat_gateway_public_ip_prefix_association : key => value }
}


