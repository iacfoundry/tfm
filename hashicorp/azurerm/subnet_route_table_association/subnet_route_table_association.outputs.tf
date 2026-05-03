output "azurerm_subnet_route_table_association_output" {
  value = { for key, value in azurerm_subnet_route_table_association.subnet_route_table_association : key => value }
}


