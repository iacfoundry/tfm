output "databricks_group_output" {
  value = merge(
    { for key, value in databricks_group.account_group : key => value },
    { for key, value in databricks_group.workspace_group : key => value }
  )
}

output "databricks_group_output_names" {
  value = merge(
    { for key, value in databricks_group.account_group : value.display_name => value },
    { for key, value in databricks_group.workspace_group : value.display_name => value }
  )
}
