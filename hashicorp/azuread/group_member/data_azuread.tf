# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
data "azuread_service_principal" "service_principal" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled && value.member_service_principal_name != null && value.existing_principal }

  display_name = each.value.member_service_principal_name
}

data "azuread_group" "group" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled && value.group_name != null && value.existing_group }

  display_name = each.value.group_name
}

data "azuread_group" "group_member" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled && value.member_group_name != null && value.existing_principal }

  display_name = each.value.member_group_name
}

data "azuread_user" "user" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled && value.member_user_name != null && value.existing_principal }

  user_principal_name = each.value.member_user_name
}

data "azuread_service_principal" "user_assigned_identity" {
  for_each = { for key, value in var.azuread_group_member_data : key => value if value.enabled && value.member_user_assigned_identity_name != null && value.existing_principal }

  display_name = each.value.member_user_assigned_identity_name
}
