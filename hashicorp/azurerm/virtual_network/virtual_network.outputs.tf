output "azurerm_virtual_network_output" {
  value = { for key, value in azurerm_virtual_network.virtual_network : key => value }
}


output "azurerm_virtual_network_output_names" {
  value = { for key, value in azurerm_virtual_network.virtual_network : value.name => value }
}

