data "databricks_service_principal" "service_principal" {
  for_each = { for key, value in var.databricks_mws_permission_assignment_data : key => value if value.enabled && value.principal_name != null && value.existing_principal }

  display_name = each.value.principal_name

}
