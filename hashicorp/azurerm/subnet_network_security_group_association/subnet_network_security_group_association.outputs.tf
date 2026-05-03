output "azurerm_subnet_network_security_group_association_output" {
  value = { for key, value in azurerm_subnet_network_security_group_association.subnet_network_security_group_association : key => value }
}


