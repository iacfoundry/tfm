# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "time_offset" "offset" {
  for_each = { for key, value in var.time_offset_data : key => value if value.enabled }

  # Required Arguments


  # Required Blocks 


  # Optional Arguments
  base_rfc3339   = each.value.base_rfc3339
  offset_days    = each.value.offset_days
  offset_hours   = each.value.offset_hours
  offset_minutes = each.value.offset_minutes
  offset_months  = each.value.offset_months
  offset_years   = each.value.offset_years
  triggers       = each.value.triggers

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
