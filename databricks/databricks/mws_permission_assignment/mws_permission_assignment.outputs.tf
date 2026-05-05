output "mws_permission_assignment_output" {
  value = { for key, value in databricks_mws_permission_assignment.mws_permission_assignment : key => value }
}
