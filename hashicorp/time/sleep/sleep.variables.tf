# -----------------------------------------
# Terraform Module
# Contributor(s): William Robinson
# Updated: March 2026
# Purpose: Terraform Resource Module
# -----------------------------------------
variable "time_sleep_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    create_duration  = optional(string)
    destroy_duration = optional(string)
    triggers         = optional(map(string))
  }))
  default = {}
}
