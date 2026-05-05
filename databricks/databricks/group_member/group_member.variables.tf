variable "databricks_group_member_data" {
  type = map(object({
    # Required
    enabled        = bool
    group_id       = optional(string) # Set to Optional for allowed lookup by name value
    group_name     = optional(string) # Optional alias for group_id
    member_id      = optional(string) # Set to Optional for allowed lookup by name value
    member_name    = optional(string) # Optional alias for member_id
    provider_scope = optional(string, "account")

    # Optional
    api             = optional(string)
    existing_member = optional(bool, false)
  }))
  default = {}
}
