# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "time_offset_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    base_rfc3339   = optional(string)
    offset_days    = optional(number)
    offset_hours   = optional(number)
    offset_minutes = optional(number)
    offset_months  = optional(number)
    offset_seconds = optional(number)
    offset_years   = optional(number)
    triggers       = optional(map(string))
  }))
  default = {}
}
