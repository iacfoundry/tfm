# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "time_rotating_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    rfc3339          = optional(string)
    rotation_days    = optional(number)
    rotation_hours   = optional(number)
    rotation_minutes = optional(number)
    rotation_months  = optional(number)
    rotation_years   = optional(number)
    rotation_rfc3339 = optional(string)
    triggers         = optional(map(string))
  }))
  default = {}
}
