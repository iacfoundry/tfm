# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
output "random_password_output" {
  value = { for key, password in random_password.random_password : key => password }
}
