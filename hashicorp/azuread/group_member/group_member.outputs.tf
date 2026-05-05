# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azuread_group_member_output" {
  value = { for key, value in azuread_group_member.group_member : key => value }
}
