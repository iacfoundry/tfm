# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_application_api_access_output" {
  value = { for key, value in azuread_application_api_access.application_api_access : key => value }
}
