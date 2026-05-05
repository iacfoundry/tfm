# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "time_sleep" "sleep" {
  for_each = { for key, value in var.time_sleep_data : key => value if value.enabled }

  # Required Arguments


  # Required Blocks 


  # Optional Arguments
  create_duration  = each.value.create_duration
  destroy_duration = each.value.destroy_duration

  triggers = each.value.triggers

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
