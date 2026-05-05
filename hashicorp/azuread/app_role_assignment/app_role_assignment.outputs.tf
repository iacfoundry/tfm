# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_app_role_assignment_output" {
  value = { for key, value in azuread_app_role_assignment.app_role_assignment : key => value }
}
