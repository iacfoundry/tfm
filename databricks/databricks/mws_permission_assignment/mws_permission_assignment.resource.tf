resource "databricks_mws_permission_assignment" "mws_permission_assignment" {
  for_each = { for key, value in var.databricks_mws_permission_assignment_data : key => value if value.enabled }

  # Required Arguments
  workspace_id = coalesce(
    try(each.value.workspace_id, null),
    try(var.azurerm_databricks_workspace_output["${each.value.workspace_name}"].workspace_id, null),
    try(data.azurerm_databricks_workspace.databricks_workspace["${each.key}"].workspace_id, null)
  )
  principal_id = coalesce(
    try(each.value.principal_id, null),
    try(var.databricks_service_principal_output["${each.value.principal_name}"].id, null),
    try(data.databricks_service_principal.service_principal["${each.key}"].id, null),
    try(var.databricks_group_output["${each.value.principal_name}"].id, null)
  )
  permissions = each.value.permissions

  # Required Blocks 



  # Optional Arguments


  # Optional Dynamic Blocks


  lifecycle {
    prevent_destroy = false
  }
}
