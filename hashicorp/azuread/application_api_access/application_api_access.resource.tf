# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azuread_application_api_access" "application_api_access" {
  for_each = { for key, value in var.azuread_application_api_access_data : key => value if value.enabled }

  # Required Arguments
  api_client_id = coalesce(
    try(each.value.api_client_id, null),
    try(data.azuread_application_published_app_ids.app.result["${each.value.api_client_name}"], null)
  )
  application_id = coalesce(
    try(each.value.application_id, null),
    try(var.azuread_application_registration_output["${each.value.application_name}"].id, null)
  )

  # Required Blocks 



  # Optional Arguments
  role_ids = coalesce(
    try(each.value.role_ids, null),
    try([for role_name in each.value.role_names :
      lookup(data.azuread_service_principal.sp["${each.key}"].app_role_ids, role_name)
    ], null)
  )
  scope_ids = coalesce(
    try(each.value.scope_ids, null),
    try([for scope_name in each.value.scope_names :
      lookup(data.azuread_service_principal.sp["${each.key}"].oauth2_permission_scope_ids, scope_name)
    ], null)
  )


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
