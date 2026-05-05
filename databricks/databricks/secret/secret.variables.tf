variable "databricks_secret_data" {
  type = map(object({
    # Required  
    enabled      = bool
    key          = string
    string_value = string
    scope        = string

    # Optional  
  }))
  default = {}
}
