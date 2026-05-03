output "azurerm_resource_group_output" {
  value = { for key, value in azurerm_resource_group.resource_group : key => value }
}


output "azurerm_resource_group_output_names" {
  value = { for key, value in azurerm_resource_group.resource_group : value.name => value }
}

