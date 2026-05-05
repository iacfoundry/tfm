# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_service_principal_output" {
  value = { for key, value in azuread_service_principal.service_principal : key => value }
}

output "azuread_service_principal_output_names" {
  value = { for key, value in azuread_service_principal.service_principal : value.display_name => value }
}
