output "azurerm_key_vault_output" {
  value = { for key, value in azurerm_key_vault.key_vault : key => value }
}


output "azurerm_key_vault_output_names" {
  value = { for key, value in azurerm_key_vault.key_vault : value.name => value }
}

