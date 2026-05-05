# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
module "time_rotating" {

  source = "../../time/rotating"

  time_rotating_data = {
    for k, v in var.azuread_application_password_data : k => v
    if v.rotation_minutes != null || v.rotation_hours != null || v.rotation_days != null || v.rotation_months != null || v.rotation_years != null
  }
}
