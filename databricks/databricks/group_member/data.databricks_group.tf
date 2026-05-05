data "databricks_group" "account_group" {
  for_each = { for key, value in var.databricks_group_member_data : key => value if value.enabled && value.member_name != null && value.existing_member && value.provider_scope == "account" }
  provider = databricks

  display_name = each.value.member_name
}

data "databricks_group" "workspace_group" {
  for_each = { for key, value in var.databricks_group_member_data : key => value if value.enabled && value.member_name != null && value.existing_member && value.provider_scope == "workspace" }
  provider = databricks.workspace

  display_name = each.value.member_name
}
