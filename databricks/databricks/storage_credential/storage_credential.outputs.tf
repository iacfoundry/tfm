output "storage_credential_output" {
  value = merge(
    { for key, value in databricks_storage_credential.account_storage_credential : key => value },
    { for key, value in databricks_storage_credential.workspace_storage_credential : key => value }
  )
}

output "storage_credential_output_names" {
  value = merge(
    { for key, value in databricks_storage_credential.account_storage_credential : value.name => value },
    { for key, value in databricks_storage_credential.workspace_storage_credential : value.name => value }
  )
}
