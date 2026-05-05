# databricks workspace_conf module examples

databricks_workspace_conf_data = {
  # Example 1: Enable IP access lists
  ip-access-lists = {
    enabled = true

    custom_config = {
      enableIpAccessLists = true
    }
  }

  # Example 2: Configure token lifetime
  token-lifetime = {
    enabled = true

    custom_config = {
      enableTokensConfig   = true
      maxTokenLifetimeDays = "90"
    }
  }

  # Example 3: Enable legacy cluster features
  legacy-features = {
    enabled = true

    custom_config = {
      enableDeprecatedClusterNamedInitScripts = true
      enableDeprecatedGlobalInitScripts       = true
    }
  }

  # Example 4: Complete configuration
  full-config = {
    enabled = true

    custom_config = {
      enableIpAccessLists                     = true
      maxTokenLifetimeDays                    = "180"
      enableTokensConfig                      = true
      enableDeprecatedClusterNamedInitScripts = false
      enableDeprecatedGlobalInitScripts       = false
    }
  }

  # Example 5: Minimal configuration
  minimal-config = {
    enabled = true

    custom_config = {
    }
  }

  # Example 6: Disabled configuration
  disabled-config = {
    enabled = false

    custom_config = {
      enableIpAccessLists = true
    }
  }
}
