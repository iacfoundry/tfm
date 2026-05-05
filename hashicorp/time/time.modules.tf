# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
module "offset" {
  source = "./modules/hashicorp/time/offset"

  time_offset_data = var.time_offset_data
}

module "rotating" {
  source = "./modules/hashicorp/time/rotating"

  time_rotating_data = var.time_rotating_data
}

module "sleep" {
  source = "./modules/hashicorp/time/sleep"

  time_sleep_data = var.time_sleep_data
}

module "static" {
  source = "./modules/hashicorp/time/static"

  time_static_data = var.time_static_data
}
