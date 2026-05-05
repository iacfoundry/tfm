output "metastore_data_access_output" {
  value = merge(
    { for key, value in databricks_metastore_data_access.account_metastore_data_access : key => value },
    { for key, value in databricks_metastore_data_access.workspace_metastore_data_access : key => value }
  )
}

output "metastore_data_access_output_names" {
  value = merge(
    { for key, value in databricks_metastore_data_access.account_metastore_data_access : value.name => value },
    { for key, value in databricks_metastore_data_access.workspace_metastore_data_access : value.name => value }
  )
}
