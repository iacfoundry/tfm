# PIPELINE VARIABLES
variable "client_secret" {
  default = null
}

variable "databricks_account_id" {
  default = ""
}

variable "databricks_sp_secret" {
  default = ""
}

variable "databricks_workspace" {
  default = ""
}

# TFVAR VARIABLES
variable "databricks_entitlements_data" {
  default = {}
}

variable "databricks_grant_data" {
  default = {}
}

variable "databricks_group_data" {
  default = {}
}

variable "databricks_group_member_data" {
  default = {}
}

variable "databricks_ip_access_list_data" {
  default = {}
}

variable "databricks_metastore_data" {
  default = {}
}

variable "databricks_metastore_assignment_data" {
  default = {}
}

variable "databricks_metastore_data_access_data" {
  default = {}
}

variable "databricks_mws_permission_assignment_data" {
  default = {}
}

variable "databricks_secret_data" {
  default = {}
}

variable "databricks_secret_scope_data" {
  default = {}
}

variable "azurerm_key_vault_output" {
  default = {}
}

variable "databricks_service_principal_data" {
  default = {}
}

variable "databricks_service_principal_secret_data" {
  default = {}
}

variable "databricks_storage_credential_data" {
  default = {}
}

variable "databricks_workspace_conf_data" {
  default = {}
}
