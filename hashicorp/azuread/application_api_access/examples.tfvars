azuread_application_api_access_data = {
  "example_application_api_access" = {
    enabled        = true
    api_client_id  = "00000000-0000-0000-0000-000000000001"
    application_id = "/applications/11111111-1111-1111-1111-111111111111"
    role_ids       = ["00000003-0000-0000-c000-000000000000", "00000003-0000-0000-c000-000000000000", "00000003-0000-0000-c000-000000000000", "00000003-0000-0000-c000-000000000000"]
  }
  "example_disabled_application_api_access" = {
    enabled          = false
    api_client_name  = "MicrosoftGraph"
    application_name = "Service Principal Example"
    role_names       = ["Application.ReadWrite.All", "Group.ReadWrite.All", "GroupMember.ReadWrite.All", "User.Read.All"]
  }
}
