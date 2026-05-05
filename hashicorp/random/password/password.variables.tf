# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "random_password_data" {
  type = map(object({
    # Required
    enabled = bool
    length  = number

    # Optional
    keepers          = optional(map(any))
    lower            = optional(bool)
    min_lower        = optional(number)
    min_numeric      = optional(number)
    min_special      = optional(number)
    min_upper        = optional(number)
    numeric          = optional(bool)
    override_special = optional(string, "-_.~") # Default value is set to "!@$^*-_"
    special          = optional(string)
    upper            = optional(bool)
  }))
  default = {}
}
