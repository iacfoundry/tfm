# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "time_static_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    rfc3339  = optional(string)
    triggers = optional(map(any))
  }))
  default = {}
}
