module "databricks_entitlements" {
  source = "./modules/databricks/databricks/entitlements"

  providers = {
    databricks = databricks.workspace
  }

  databricks_entitlements_data = var.databricks_entitlements_data
  #databricks_user_output       = module.databricks_user.databricks_user_output_names
  databricks_group_output             = module.databricks_group.databricks_group_output_names
  databricks_service_principal_output = module.databricks_service_principal.databricks_service_principal_output_names

  depends_on = [module.databricks_group]

}

module "databricks_grant" {
  source = "./modules/databricks/databricks/grant"

  providers = {
    databricks = databricks.workspace
  }

  databricks_grant_data = var.databricks_grant_data

  depends_on = [module.azurerm_databricks_workspace, module.databricks_group]
}

module "databricks_ip_access_list" {
  source = "./modules/databricks/databricks/ip_access_list"

  providers = {
    databricks = databricks.workspace
  }

  databricks_ip_access_list_data = var.databricks_ip_access_list_data

  depends_on = [module.databricks_workspace_conf]
}

module "databricks_secret" {
  source = "./modules/databricks/databricks/secret"

  providers = {
    databricks = databricks.workspace
  }

  databricks_secret_data = var.databricks_secret_data
}

module "databricks_secret_scope" {
  source = "./modules/databricks/databricks/secret_scope"

  providers = {
    databricks = databricks.workspace
  }

  databricks_secret_scope_data = var.databricks_secret_scope_data
  azurerm_key_vault_output     = module.azurerm_key_vault.azurerm_key_vault_output_names
}

module "databricks_workspace_conf" {
  source = "./modules/databricks/databricks/workspace_conf"

  providers = {
    databricks = databricks.workspace
  }

  databricks_workspace_conf_data = var.databricks_workspace_conf_data

  depends_on = [module.azurerm_databricks_workspace]
}
