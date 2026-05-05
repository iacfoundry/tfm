output "databricks_service_principal_secret_output" {
  value = merge(
    { for key, value in databricks_service_principal_secret.account_service_principal_secret : key => value },
    { for key, value in databricks_service_principal_secret.workspace_service_principal_secret : key => value }
  )
}
