output "azurerm_route_table_output" {
  value = { for key, value in azurerm_route_table.route_table : key => value }
}


output "azurerm_route_table_output_names" {
  value = { for key, value in azurerm_route_table.route_table : value.name => value }
}

