output "databricks_group_member_output" {
  value = merge(
    { for key, value in databricks_group_member.account_group_member : key => value },
    { for key, value in databricks_group_member.workspace_group_member : key => value }
  )
}
