# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_application_identifier_uri_output" {
  value = { for key, value in azuread_application_identifier_uri.identifier_uri : key => value }
}

