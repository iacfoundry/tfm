# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "time_offset_output" {
  value = { for key, value in time_offset.offset : key => value }
}
