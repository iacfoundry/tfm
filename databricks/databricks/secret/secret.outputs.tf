output "secret_output" {
  value = { for key, value in databricks_secret.secret : key => value }
}
