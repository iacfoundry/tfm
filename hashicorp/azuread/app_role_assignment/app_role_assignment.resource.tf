# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azuread_app_role_assignment" "app_role_assignment" {
  for_each = { for key, value in var.azuread_app_role_assignment_data : key => value if value.enabled }

  # Required Arguments
  app_role_id = each.value.app_role_id
  principal_object_id = coalesce(
    try(each.value.principal_object_id, null),
    try(var.azuread_service_principal_output["${each.value.principal_name}"].object_id, null)
  )
  resource_object_id = each.value.resource_object_id

  # Required Blocks 


  # Optional Arguments


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
