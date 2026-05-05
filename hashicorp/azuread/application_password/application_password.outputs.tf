# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_application_password_output" {
  value = { for key, value in azuread_application_password.application_password : key => value }
}

output "azuread_application_password_output_names" {
  value = { for key, value in azuread_application_password.application_password : value.display_name => value... }
}
