output "databricks_metastore_assignment_output" {
  value = merge(
    { for key, value in databricks_metastore_assignment.account_metastore_assignment : key => value },
    { for key, value in databricks_metastore_assignment.workspace_metastore_assignment : key => value }
  )
}


