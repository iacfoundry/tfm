variable "databricks_ip_access_list_data" {
  type = map(object({
    # Required  
    enabled      = bool
    label        = string
    list_type    = string
    ip_addresses = list(string)

    # Optional  
  }))
  validation {
    condition     = alltrue([for v in values(var.databricks_ip_access_list_data) : v.list_type == "ALLOW" || v.list_type == "BLOCK"])
    error_message = "The list_type must be either 'ALLOW' or 'BLOCK'."
  }
  default = {}
}
