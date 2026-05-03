output "azurerm_custom_ip_prefix_output" {
  value = { for key, value in azurerm_custom_ip_prefix.custom_ip_prefix : key => value }
}


output "azurerm_custom_ip_prefix_output_names" {
  value = { for key, value in azurerm_custom_ip_prefix.custom_ip_prefix : value.name => value }
}

