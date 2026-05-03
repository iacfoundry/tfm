output "azurerm_subnet_output" {
  value = { for key, value in azurerm_subnet.subnet : key => value }
}


output "azurerm_subnet_output_names" {
  value = { for key, value in azurerm_subnet.subnet : value.name => value }
}

