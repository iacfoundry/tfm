variable "databricks_metastore_assignment_data" {
  type = map(object({
    # Required
    enabled        = bool
    metastore_id   = optional(string) # Set to Optional for allowed lookup by name value
    metastore_name = optional(string) # Optional alias for metastore_id
    workspace_id   = optional(number) # Set to Optional for allowed lookup by name value
    workspace_name = optional(string) # Optional alias for workspace_id
    provider_scope = optional(string, "account")

    # Optional
    metastore_region = optional(string) # Optional alias to look up metastore by region name

  }))
  default = {}
}
