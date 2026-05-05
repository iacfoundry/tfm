# databricks secret module examples

databricks_secret_data = {
  # Example 1: Database connection string
  db-connection = {
    enabled      = true
    key          = "database_url"
    string_value = "postgresql://user:password@db.example.com:5432/mydb"
    scope        = "database"
  }

  # Example 2: API key
  api-key = {
    enabled      = true
    key          = "api_token"
    string_value = "sk-1234567890abcdef"
    scope        = "external_services"
  }

  # Example 3: Cloud storage credentials
  aws-secret = {
    enabled      = true
    key          = "aws_secret_key"
    string_value = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
    scope        = "cloud_credentials"
  }

  # Example 4: Auth token
  auth-token = {
    enabled      = true
    key          = "oauth_token"
    string_value = "ghp_1234567890abcdef1234567890abcdef"
    scope        = "github"
  }

  # Example 5: Certificate
  ssl-cert = {
    enabled      = true
    key          = "ssl_certificate"
    string_value = "-----BEGIN CERTIFICATE-----\nMIIDXTCCAkWgAwIBAgIJAK...\n-----END CERTIFICATE-----"
    scope        = "certificates"
  }

  # Example 6: Disabled secret
  disabled-secret = {
    enabled      = false
    key          = "old_api_key"
    string_value = "deprecated_key_value"
    scope        = "archived"
  }
}
