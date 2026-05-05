# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "azurerm_databricks_workspace_output" {
  value = { for key, value in azurerm_databricks_workspace.databricks_workspace : key => value }
}

output "azurerm_databricks_workspace_output_names" {
  value = { for key, value in azurerm_databricks_workspace.databricks_workspace : value.name => value }
}
