provider "databricks" {
  alias           = "account"
  host            = "https://accounts.azuredatabricks.net"
  auth_type       = "github-oidc-azure"
  account_id      = var.databricks_account_id
  azure_client_id = data.azurerm_client_config.current.client_id
  azure_tenant_id = data.azurerm_client_config.current.tenant_id
}

provider "databricks" {
  alias           = "workspace"
  auth_type       = "github-oidc-azure"
  host            = var.databricks_workspace
  azure_client_id = data.azurerm_client_config.current.client_id
  azure_tenant_id = data.azurerm_client_config.current.tenant_id
}
