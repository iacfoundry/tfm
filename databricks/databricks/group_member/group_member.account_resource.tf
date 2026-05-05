resource "databricks_group_member" "account_group_member" {
  for_each = { for key, value in var.databricks_group_member_data : key => value if value.enabled && value.provider_scope == "account" }

  provider = databricks

  # Required Arguments
  group_id = coalesce(
    try(each.value.group_id, null),
    try(var.databricks_group_output["${each.value.group_name}"].id, null),
    try(data.databricks_group.account_group["${each.value.group_name}"].id, null)
  )

  member_id = coalesce(
    try(each.value.member_id, null),
    try(var.databricks_service_principal_output["${each.value.member_name}"].id, null),
    try(var.databricks_group_output["${each.value.member_name}"].id, null),
    try(var.databricks_user_output["${each.value.member_name}"].id, null),
    try(data.databricks_group.account_group["${each.value.member_name}"].id, null),
    try(data.databricks_service_principal.account_service_principal["${each.value.member_name}"].id, null),
    try(data.databricks_user.account_user["${each.value.member_name}"].id, null)
  )

  # Optional Arguments
  api = each.value.api

  lifecycle {
    prevent_destroy = false
  }
}
