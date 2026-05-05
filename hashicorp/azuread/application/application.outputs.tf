# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_application_output" {
  value = { for key, value in azuread_application.application : key => value }
}

output "azuread_application_output_names" {
  value = { for key, value in azuread_application.application : value.display_name => value }
}
