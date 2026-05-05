# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
module "random_password" {
  source = "./modules/hashicorp/random/password"

  random_password_data = var.random_password_data
}