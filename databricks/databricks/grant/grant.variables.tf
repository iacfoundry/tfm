variable "databricks_grant_data" {
  type = map(object({
    # Required Arguments
    enabled    = bool
    principal  = string
    privileges = list(string)

    # Optional Arguments
    catalog            = optional(string)
    external_location  = optional(string)
    foreign_connection = optional(string)
    function           = optional(string)
    model              = optional(string)
    schema             = optional(string)
    share              = optional(string)
    storage_credential = optional(string)
    table              = optional(string)
    volume             = optional(string)
  }))
  default = {}
}
