data "databricks_user" "account_user" {
  for_each = { for key, value in var.databricks_group_member_data : key => value if value.enabled && value.member_name != null && value.existing_member && value.provider_scope == "account" }
  provider = databricks

  user_name = each.value.member_name

}

data "databricks_user" "workspace_user" {
  for_each = { for key, value in var.databricks_group_member_data : key => value if value.enabled && value.member_name != null && value.existing_member && value.provider_scope == "workspace" }
  provider = databricks.workspace

  user_name = each.value.member_name

}
