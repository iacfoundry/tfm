module "databricks_group" {
  source = "./modules/databricks/databricks/group"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_group_data = var.databricks_group_data

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_metastore" {
  source = "./modules/databricks/databricks/metastore"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_metastore_data = var.databricks_metastore_data

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_metastore_assignment" {
  source = "./modules/databricks/databricks/metastore_assignment"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_metastore_assignment_data = var.databricks_metastore_assignment_data
  databricks_metastore_output          = module.databricks_metastore.databricks_metastore_output_names
  azurerm_databricks_workspace_output  = module.azurerm_databricks_workspace.azurerm_databricks_workspace_output_names

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_metastore_data_access" {
  source = "./modules/databricks/databricks/metastore_data_access"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_metastore_data_access_data = var.databricks_metastore_data_access_data

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_service_principal" {
  source = "./modules/databricks/databricks/service_principal"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_service_principal_data       = var.databricks_service_principal_data
  azuread_application_registration_output = module.azuread_application_registration.azuread_application_registration_output_names

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_service_principal_secret" {
  source = "./modules/databricks/databricks/service_principal_secret"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_service_principal_secret_data = var.databricks_service_principal_secret_data
  databricks_service_principal_output      = module.databricks_service_principal.databricks_service_principal_output_names
  azurerm_key_vault_output                 = module.azurerm_key_vault.azurerm_key_vault_output_names

  depends_on = [module.azurerm_databricks_workspace]
}

module "databricks_storage_credential" {
  source = "./modules/databricks/databricks/storage_credential"

  providers = {
    databricks           = databricks.account
    databricks.account   = databricks.account
    databricks.workspace = databricks.workspace
  }

  databricks_storage_credential_data = var.databricks_storage_credential_data

  depends_on = [module.azurerm_databricks_workspace]
}
