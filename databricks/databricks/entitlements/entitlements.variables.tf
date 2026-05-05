variable "databricks_entitlements_data" {
  type = map(object({
    # Required Arguments
    enabled                = bool
    user_id                = optional(string)
    user_name              = optional(string)
    group_id               = optional(string)
    group_name             = optional(string)
    service_principal_id   = optional(string)
    service_principal_name = optional(string)

    # Optional Arguments
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}

variable "databricks_user_output" {
  default = {}
}

variable "databricks_group_output" {
  default = {}
}

variable "databricks_service_principal_output" {
  default = {}

}
