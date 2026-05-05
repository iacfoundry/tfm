# databricks ip_access_list module examples

databricks_ip_access_list_data = {
  # Example 1: Allow office network
  office-allow = {
    enabled      = true
    label        = "Office Network"
    list_type    = "ALLOW"
    ip_addresses = ["203.0.113.0/24", "198.51.100.0/24"]
  }

  # Example 2: Allow VPN ranges
  vpn-allow = {
    enabled      = true
    label        = "VPN Access"
    list_type    = "ALLOW"
    ip_addresses = ["192.0.2.0/25"]
  }

  # Example 3: Block known threat IPs
  threat-block = {
    enabled      = true
    label        = "Threat IPs"
    list_type    = "BLOCK"
    ip_addresses = ["203.0.113.100", "203.0.113.101", "203.0.113.102"]
  }

  # Example 4: Allow specific data center subnet
  datacenter-allow = {
    enabled      = true
    label        = "Data Center Subnet"
    list_type    = "ALLOW"
    ip_addresses = ["198.51.100.0/23"]
  }

  # Example 5: Disabled IP list
  disabled-list = {
    enabled      = false
    label        = "Temporary Block"
    list_type    = "BLOCK"
    ip_addresses = ["203.0.113.200"]
  }
}
