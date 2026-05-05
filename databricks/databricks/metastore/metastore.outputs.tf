output "databricks_metastore_output" {
  value = merge(
    { for key, value in databricks_metastore.account_metastore : key => value },
    { for key, value in databricks_metastore.workspace_metastore : key => value }
  )
}

output "databricks_metastore_output_names" {
  value = merge(
    { for key, value in databricks_metastore.account_metastore : value.name => value },
    { for key, value in databricks_metastore.workspace_metastore : value.name => value }
  )
}
