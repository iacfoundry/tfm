module "databricks_mws_permission_assignment" {
  source = "./modules/databricks/databricks/mws_permission_assignment"

  providers = {
    databricks = databricks.account
  }

  databricks_mws_permission_assignment_data = var.databricks_mws_permission_assignment_data
  databricks_service_principal_output       = module.databricks_service_principal.databricks_service_principal_output_names
  azurerm_databricks_workspace_output       = module.azurerm_databricks_workspace.azurerm_databricks_workspace_output_names
  databricks_group_output                   = module.databricks_group.databricks_group_output_names

  depends_on = [module.azurerm_databricks_workspace, module.databricks_service_principal, module.databricks_group, module.databricks_metastore_assignment]
}
