output "azurerm_network_security_group_output" {
  value = { for key, value in azurerm_network_security_group.network_security_group : key => value }
}


output "azurerm_network_security_group_output_names" {
  value = { for key, value in azurerm_network_security_group.network_security_group : value.name => value }
}

