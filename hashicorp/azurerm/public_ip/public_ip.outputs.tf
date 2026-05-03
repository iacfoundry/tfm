output "azurerm_public_ip_output" {
  value = { for key, value in azurerm_public_ip.public_ip : key => value }
}


output "azurerm_public_ip_output_names" {
  value = { for key, value in azurerm_public_ip.public_ip : value.name => value }
}

