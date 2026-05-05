# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azuread_application_password" "application_password" {
  for_each = { for key, value in var.azuread_application_password_data : key => value if value.enabled }

  # Required Arguments
  application_id = coalesce(
    try(each.value.application_id, null),
    try(var.azuread_application_registration_output["${each.value.application_name}"].id, null),
    try(var.azuread_application_output["${each.value.application_name}"].id, null)
  )


  # Required Blocks 



  # Optional Arguments
  display_name = each.value.display_name
  # end_date_relative   = each.value.end_date_relative
  end_date = try(coalesce(
    try(each.value.end_date, null),
    try(timeadd(module.time_rotating.time_rotating_output[each.key].rotation_rfc3339, "${each.value.end_date_add_hours}h"), null)
  ), null)
  rotate_when_changed = try(coalesce(
    try(each.value.rotate_when_changed, null),
    try({ rotation = module.time_rotating.time_rotating_output[each.key].id }, null)
  ), null)
  start_date = each.value.start_date


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
