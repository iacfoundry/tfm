azuread_application_data = {
  "example_application" = {
    enabled          = true
    display_name     = "example-application"
    description      = "Example Azure AD application"
    sign_in_audience = "AzureADMyOrg"
    tags             = ["example", "azuread"]

    web = {
      homepage_url  = "https://example.com"
      logout_url    = "https://example.com/logout"
      redirect_uris = ["https://example.com/auth"]
      implicit_grant = {
        access_token_issuance_enabled = true
        id_token_issuance_enabled     = true
      }
    }
  }
}
