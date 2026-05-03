terraform {

  required_providers {
    azurerm = {
      # https://registry.terraform.io/providers/hashicorp/azurerm/latest
      source  = "hashicorp/azurerm"
      version = ">=4.71.0"
    }
    azuread = {
      # https://registry.terraform.io/providers/hashicorp/azuread/latest
      source  = "hashicorp/azuread"
      version = ">=3.8.0"
    }
    random = {
      # https://registry.terraform.io/providers/hashicorp/random/latest
      source  = "hashicorp/random"
      version = ">=3.8.1"
    }
    databricks = {
      # https://registry.terraform.io/providers/databricks/databricks/latest
      source  = "databricks/databricks"
      version = ">=1.114.2"
    }
    snowflake = {
      # https://registry.terraform.io/providers/snowflakedb/snowflake/latest
      source  = "snowflakedb/snowflake"
      version = ">=2.15.0"
    }
    tls = {
      # https://registry.terraform.io/providers/hashicorp/tls/latest
      source  = "hashicorp/tls"
      version = ">=4.2.1"
    }
    time = {
      # https://registry.terraform.io/providers/hashicorp/time/latest
      source  = "hashicorp/time"
      version = ">=0.13.1"
    }
  }
}
