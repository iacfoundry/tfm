
### AZUREAD_APPLICATION MODULE
## Updated 01/16/2025 10:45:29

# AZUREAD_APPLICATION_DATA.TFVARS EXAMPLE
```
azuread_application_data = {  
  app01 = {  
    enabled                         = true  
    display_name                    = "example"  
    description                     = "Example Application"  
    device_only_auth_enabled        = false  
    fallback_public_client_enabled  = false  
    group_membership_claims         = ["SecurityGroup"]  
    identifier_uris                 = ["api://example-app"]  
    logo_image                      = filebase64("/path/to/logo.png")  
    marketing_url                   = "https://example.com/marketing"  
    notes                           = "Some notes"  
    oauth2_post_response_required   = false  
    owners                          = ["owner-object-id"]  
    prevent_duplicate_names         = false  
    privacy_statement_url           = "https://example.com/privacy"  
    service_management_reference    = "Service Management Reference"  
    sign_in_audience                = "AzureADMultipleOrgs"  
    support_url                     = "https://example.com/support"  
    tags                            = ["tag1", "tag2"]  
    template_id                     = "template-id"  
    terms_of_service_url            = "https://example.com/terms"  
  
    api = {  
      mapped_claims_enabled          = true  
      requested_access_token_version = 2  
      known_client_applications      = ["client-id-1", "client-id-2"]  
  
      oauth2_permission_scope = [  
        {  
          admin_consent_description  = "Allow the application to access example on behalf of the signed-in user."  
          admin_consent_display_name = "Access example"  
          enabled                    = true  
          id                         = "96183846-204b-4b43-82e1-5d2222eb4b9b"  
          type                       = "User"  
          user_consent_description   = "Allow the application to access example on your behalf."  
          user_consent_display_name  = "Access example"  
          value                      = "user_impersonation"  
        }  
      ]  
    }  
  
    app_role = [  
      {  
        allowed_member_types = ["User", "Application"]  
        description          = "Admins can manage roles and perform all task actions"  
        display_name         = "Admin"  
        enabled              = true  
        id                   = "1b19509b-32b1-4e9f-b71d-4992aa991967"  
        value                = "admin"  
      }  
    ]  
  
    feature_tags = {  
      custom_single_sign_on = false  
      enterprise            = true  
      gallery               = true  
      hide                  = false  
    }  
  
    optional_claims = {  
      access_token = [  
        {  
          name                  = "myclaim"  
          source                = null  
          essential             = false  
          additional_properties = []  
        }  
      ]  
  
      id_token = [  
        {  
          name                  = "userclaim"  
          source                = "user"  
          essential             = true  
          additional_properties = ["emit_as_roles"]  
        }  
      ]  
  
      saml2_token = [  
        {  
          name                  = "samlexample"  
          source                = null  
          essential             = false  
          additional_properties = []  
        }  
      ]  
    }  
  
    password = [  
      {  
        display_name = "MySecret-1"  
        end_date     = "2024-01-01T01:02:03Z"  
        start_date   = "2023-01-01T01:02:03Z"  
      }  
    ]  
  
    public_client = {  
      redirect_uris = ["https://example.com/redirect"]  
    }  
  
    required_resource_access = [  
      {  
        resource_app_id = "00000003-0000-0000-c000-000000000000"  
        resource_access = [  
          {  
            id   = "df021288-bdef-4463-88db-98f22de89214"  
            type = "Role"  
          }  
        ]  
      }  
    ]  
  
    single_page_application = {  
      redirect_uris = ["https://example.com/spa"]  
    }  
  
    web = {  
      homepage_url  = "https://app.example.net"  
      logout_url    = "https://app.example.net/logout"  
      redirect_uris = ["https://app.example.net/account"]  
  
      implicit_grant = {  
        access_token_issuance_enabled = true  
        id_token_issuance_enabled     = true  
      }  
    }  
  }  
}  
```

# AZUREAD_APPLICATION MAIN.TF MODULE REFERENCE
```
module "azuread_application" {
        source = "./modules/hashicorp/azuread/application"

        azuread_application_data = var.azuread_application_data
}
```

# AZUREAD_APPLICATION ROOT VARIABLES.TF
```
variable "azuread_application_data" {
  type = map(object({
    # Required  
    enabled      = bool
    display_name = string

    # Optional  
    description                    = optional(string)
    device_only_auth_enabled       = optional(bool, false)
    fallback_public_client_enabled = optional(bool, false)
    group_membership_claims        = optional(set(string))
    identifier_uris                = optional(set(string))
    logo_image                     = optional(string)
    marketing_url                  = optional(string)
    notes                          = optional(string)
    oauth2_post_response_required  = optional(bool, false)
    owners                         = optional(set(string))
    prevent_duplicate_names        = optional(bool, false)
    privacy_statement_url          = optional(string)
    service_management_reference   = optional(string)
    sign_in_audience               = optional(string, "AzureADMyOrg")
    support_url                    = optional(string)
    tags                           = optional(set(string))
    template_id                    = optional(string)
    terms_of_service_url           = optional(string)

    # Optional Blocks  
    api = optional(object({
      mapped_claims_enabled          = optional(bool, false)
      requested_access_token_version = optional(number, 1)
      known_client_applications      = optional(set(string))
      oauth2_permission_scope = optional(list(object({
        admin_consent_description  = string
        admin_consent_display_name = string
        enabled                    = optional(bool, true)
        id                         = string
        type                       = optional(string, "User")
        user_consent_description   = optional(string)
        user_consent_display_name  = optional(string)
        value                      = optional(string)
      })))
    }))

    app_role = optional(list(object({
      allowed_member_types = list(string)
      description          = string
      display_name         = string
      enabled              = optional(bool, true)
      id                   = string
      value                = optional(string)
    })))

    feature_tags = optional(object({
      custom_single_sign_on = optional(bool, false)
      enterprise            = optional(bool, false)
      gallery               = optional(bool, false)
      hide                  = optional(bool, false)
    }))

    optional_claims = optional(object({
      access_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
      id_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
      saml2_token = optional(list(object({
        name                  = string
        source                = optional(string)
        essential             = optional(bool)
        additional_properties = optional(list(string))
      })))
    }))

    password = optional(list(object({
      display_name = string
      end_date     = optional(string)
      start_date   = optional(string)
    })))

    public_client = optional(object({
      redirect_uris = optional(set(string))
    }))

    required_resource_access = optional(list(object({
      resource_app_id = string
      resource_access = list(object({
        id   = string
        type = string
      }))
    })))

    single_page_application = optional(object({
      redirect_uris = optional(set(string))
    }))

    web = optional(object({
      homepage_url  = optional(string)
      logout_url    = optional(string)
      redirect_uris = optional(set(string))
      implicit_grant = optional(object({
        access_token_issuance_enabled = optional(bool)
        id_token_issuance_enabled     = optional(bool)
      }))
    }))
  }))
  default = {}
}
```
