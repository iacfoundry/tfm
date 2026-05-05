data "azurerm_databricks_workspace" "databricks_workspace" {
  for_each = { for key, value in var.databricks_mws_permission_assignment_data : key => value if value.enabled && value.workspace_name != null && value.existing_workspace }

  name                = each.value.workspace_name
  resource_group_name = each.value.workspace_resource_group_name
}
