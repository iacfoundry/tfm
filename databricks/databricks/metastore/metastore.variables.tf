variable "databricks_metastore_data" {
  type = map(object({
    # Required
    enabled        = bool
    name           = string
    provider_scope = optional(string, "account")

    # Optional
    delta_sharing_scope                               = optional(string)
    delta_sharing_recipient_token_lifetime_in_seconds = optional(number)
    delta_sharing_organization_name                   = optional(string)
    force_destroy                                     = optional(bool)
    owner                                             = optional(string)
    storage_root                                      = optional(string)

    # Optional Dynamic Blocks
  }))
  default = {}
}