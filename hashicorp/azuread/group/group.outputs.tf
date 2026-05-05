# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_group_output" {
  value = { for key, value in azuread_group.group : key => value }
}

output "azuread_group_output_names" {
  value = { for key, value in azuread_group.group : value.display_name => value }
}
