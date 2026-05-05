# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "time_static_output" {
  value = { for key, value in time_static.static : key => value }
}
