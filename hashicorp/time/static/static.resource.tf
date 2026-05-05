# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "time_static" "static" {
  for_each = { for key, value in var.time_static_data : key => value if value.enabled }

  # Required Arguments


  # Required Blocks 


  # Optional Arguments
  rfc3339  = each.value.rfc3339
  triggers = each.value.triggers

  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
