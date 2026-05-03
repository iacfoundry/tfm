# --------------------------------------------------------------
# Terraform Module Tests
# Contributor(s): William Robinson
# Created: March 2026
# Updated: April 2026
# Purpose: Terraform Resource Module Test Provider and run steps
# --------------------------------------------------------------

mock_provider "azurerm" {
  alias = "mock"
}

# mock_provider "azuread" {
#   alias = "mock"
# }

# mock_provider "databricks" {
#   alias = "mock_account"
# }

# mock_provider "databricks" {
#   alias = "mock_workspace"
# }

run "mock_plan" {
  providers = {
    azurerm = azurerm.mock
    # azuread = azuread.mock
    # databricks.account   = databricks.mock_account
    # databricks.workspace = databricks.mock_workspace
  }
  command = plan
}

# run "mock_apply" {
#   providers = {
#     azurerm              = azurerm.mock
#     azuread              = azuread.mock
#     databricks.account   = databricks.mock_account
#     databricks.workspace = databricks.mock_workspace
#   }
#   command = apply
# }
