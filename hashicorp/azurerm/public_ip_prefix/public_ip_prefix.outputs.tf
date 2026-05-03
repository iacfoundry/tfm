output "azurerm_public_ip_prefix_output" {
  value = { for key, value in azurerm_public_ip_prefix.public_ip_prefix : key => value }
}


output "azurerm_public_ip_prefix_output_names" {
  value = { for key, value in azurerm_public_ip_prefix.public_ip_prefix : value.name => value }
}

