# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "time_sleep_output" {
  value = { for key, value in time_sleep.sleep : key => value }
}
