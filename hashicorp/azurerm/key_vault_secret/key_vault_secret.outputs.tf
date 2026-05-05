output "azurerm_key_vault_secret_output" {
  value = { for key, value in azurerm_key_vault_secret.key_vault_secret : key => value }
}


output "azurerm_key_vault_secret_output_names" {
  value = { for key, value in azurerm_key_vault_secret.key_vault_secret : value.name => value }
}

