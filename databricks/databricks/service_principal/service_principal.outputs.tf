output "databricks_service_principal_output" {
  value = merge(
    { for key, value in databricks_service_principal.account_service_principal : key => value },
    { for key, value in databricks_service_principal.workspace_service_principal : key => value }
  )
}

output "databricks_service_principal_output_names" {
  value = merge(
    { for key, value in databricks_service_principal.account_service_principal : value.display_name => value },
    { for key, value in databricks_service_principal.workspace_service_principal : value.display_name => value }
  )
}
