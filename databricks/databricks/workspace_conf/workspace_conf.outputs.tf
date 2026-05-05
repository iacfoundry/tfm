output "databricks_workspace_conf_output" {
  value = { for key, value in databricks_workspace_conf.workspace_conf : key => value }
}