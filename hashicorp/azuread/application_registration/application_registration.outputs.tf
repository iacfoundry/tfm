# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_application_registration_output" {
  value = { for key, value in azuread_application_registration.application_registration : key => value }
}

output "azuread_application_registration_output_names" {
  value = { for key, value in azuread_application_registration.application_registration : value.display_name => value }
}
