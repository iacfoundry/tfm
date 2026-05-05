variable "databricks_service_principal_data" {
  type = map(object({
    # Required
    enabled          = bool
    application_id   = optional(string)
    application_name = optional(string)
    display_name     = optional(string)
    provider_scope   = optional(string, "account")

    # Optional
    active                     = optional(bool)
    allow_cluster_create       = optional(bool)
    allow_instance_pool_create = optional(bool)
    databricks_sql_access      = optional(bool)
    disable_as_user_deletion   = optional(bool)
    external_id                = optional(string)
    existing_application       = optional(bool, false)
    force_delete_home_dir      = optional(bool)
    force_delete_repos         = optional(bool)
    force                      = optional(bool)
    workspace_access           = optional(bool)
  }))
  default = {}
}

variable "azuread_application_registration_output" {
  default = {}
}
