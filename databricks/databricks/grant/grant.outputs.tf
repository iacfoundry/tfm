output "databricks_grant_output" {
  value = { for key, value in databricks_grant.grant : key => value }
}
