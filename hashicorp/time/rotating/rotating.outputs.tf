# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "time_rotating_output" {
  value = { for key, value in time_rotating.rotating : key => value }
}
