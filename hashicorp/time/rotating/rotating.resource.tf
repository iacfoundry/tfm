# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "time_rotating" "rotating" {
  for_each = { for key, value in var.time_rotating_data : key => value if value.enabled }

  # Required Arguments


  # Required Blocks 


  # Optional Arguments
  rfc3339          = each.value.rfc3339
  rotation_rfc3339 = each.value.rotation_rfc3339
  rotation_days    = each.value.rotation_days
  rotation_hours   = each.value.rotation_hours
  rotation_minutes = each.value.rotation_minutes
  rotation_months  = each.value.rotation_months
  rotation_years   = each.value.rotation_years
  triggers         = each.value.triggers

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
