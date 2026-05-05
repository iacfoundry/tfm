
### offset MODULE
## Updated 06/07/2024 13:11:45

# offset_DATA.TFVARS EXAMPLE
```
offset_data = {
  "offset_1" = {
    enabled          = true
    base_rfc3339          = "2023-05-20T10:00:00Z"
    offset_days    = 30
    offset_hours   = 12
    offset_minutes = 45
    offset_seconds = 60
    offset_months  = 6
    offset_years   = 1
    triggers = [
      {
        type      = "day_of_week"
        attribute = "Monday"
      },
      {
        type      = "specific_date"
        attribute = "2023-12-25"
      }
    ]
  },
  "offset_2" = {
    enabled          = true
    offset_days    = 15
    offset_hours   = 6
    offset_minutes = 30
    offset_seconds = 60
    offset_months  = 3
    offset_years   = 2
  }
}
```

# offset MAIN.TF MODULE REFERENCE
```
module "offset" {
        source = "./modules/time/offset"

        offset_data = var.offset_data
}
```

# offset ROOT VARIABLES.TF
```
variable "offset_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    base_rfc3339   = optional(string)
    offset_days    = optional(number)
    offset_hours   = optional(number)
    offset_minutes = optional(number)
    offset_months  = optional(number)
    offset_seconds = optional(number)
    offset_years   = optional(number)
    triggers         = optional(map(string))
  }))
  default = {}
}
```
