# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "azuread_group_member" "group_member" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled }

  # Required Arguments
  group_object_id = coalesce(
    try(each.value.group_object_id, null),
    try(var.azuread_group_output["${each.value.group_name}"].object_id, null),
    try(data.azuread_group.group["${each.key}"].object_id, null)
  )

  member_object_id = coalesce(
    try(each.value.member_object_id, null),
    try(var.azuread_user_output["${each.value.member_user_name}"].object_id, null),
    try(var.azuread_group_output["${each.value.member_group_name}"].object_id, null),
    try(var.azuread_service_principal_output["${each.value.member_service_principal_name}"].object_id, null),
    try(var.azurerm_user_assigned_identity_output["${each.value.member_user_assigned_identity_name}"].principal_id, null),
    try(data.azuread_user.user["${each.key}"].object_id, null),
    try(data.azuread_group.group_member["${each.key}"].object_id, null),
    try(data.azuread_service_principal.service_principal["${each.key}"].object_id, null),
    try(data.azuread_service_principal.user_assigned_identity["${each.key}"].object_id, null)
  )

  # Required Blocks 


  # Optional Arguments


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
