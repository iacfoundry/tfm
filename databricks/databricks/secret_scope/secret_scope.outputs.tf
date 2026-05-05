output "secret_scope_output" {
  value = { for key, value in databricks_secret_scope.secret_scope : key => value }
}

output "secret_scope_output_names" {
  value = { for key, value in databricks_secret_scope.secret_scope : value.name => value }
}
