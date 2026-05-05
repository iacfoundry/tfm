variable "databricks_mws_permission_assignment_data" {
  type = map(object({
    # Required
    enabled        = bool
    workspace_id   = optional(number)
    workspace_name = optional(string)
    principal_id   = optional(number)
    principal_name = optional(string)
    permissions    = list(string)

    # Optional
    existing_principal            = optional(bool, false)
    existing_workspace            = optional(bool, false)
    workspace_resource_group_name = optional(string)
  }))
  default = {}
}

variable "databricks_service_principal_output" {
  default = {}
}

variable "azurerm_databricks_workspace_output" {
  default = {}
}
variable "databricks_group_output" {
  default = {}
}
