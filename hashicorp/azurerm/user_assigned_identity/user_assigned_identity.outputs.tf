output "azurerm_user_assigned_identity_output" {
  value = { for key, value in azurerm_user_assigned_identity.user_assigned_identity : key => value }
}


output "azurerm_user_assigned_identity_output_names" {
  value = { for key, value in azurerm_user_assigned_identity.user_assigned_identity : value.name => value }
}

