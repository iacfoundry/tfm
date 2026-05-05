variable "databricks_workspace_conf_data" {
  type = map(object({
    # Required  
    enabled = bool
    custom_config = object({
      enableIpAccessLists                     = optional(bool)
      maxTokenLifetimeDays                    = optional(string)
      enableTokensConfig                      = optional(bool)
      enableDeprecatedClusterNamedInitScripts = optional(bool)
      enableDeprecatedGlobalInitScripts       = optional(bool)
    })
  }))
  default = {}
}
