# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
resource "random_password" "random_password" {
  for_each = { for key, value in var.random_password_data : key => value if value.enabled }

  length           = each.value.length
  keepers          = each.value.keepers
  lower            = each.value.lower
  min_lower        = each.value.min_lower
  min_numeric      = each.value.min_numeric
  min_special      = each.value.min_special
  min_upper        = each.value.min_upper
  numeric          = each.value.numeric
  override_special = each.value.override_special
  special          = each.value.special
  upper            = each.value.upper

}
