
variable "random_password_data" {
  type = map(object({
    # Required
    enabled = bool
    length  = number
    keepers = map(any)

    # Optional
    lower            = optional(bool)
    min_lower        = optional(number)
    min_numeric      = optional(number)
    min_special      = optional(number)
    min_upper        = optional(number)
    numeric          = optional(bool)
    override_special = optional(string)
    special          = optional(string)
    upper            = optional(bool)
  }))
}
