variable "databricks_group_data" {
  type = map(object({
    # Required Arguments
    enabled        = bool
    display_name   = string
    provider_scope = optional(string, "account")

    # Optional Arguments
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    external_id                = optional(string)
    force                      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}
