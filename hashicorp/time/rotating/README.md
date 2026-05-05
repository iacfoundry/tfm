
### ROTATING MODULE
## Updated 06/07/2024 13:11:45

# ROTATING_DATA.TFVARS EXAMPLE
```
rotating_data = {
  "rotation_1" = {
    enabled          = true
    rfc3339          = "2023-05-20T10:00:00Z"
    rotation_days    = 30
    rotation_hours   = 12
    rotation_minutes = 45
    rotation_months  = 6
    rotation_years   = 1
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
  "rotation_2" = {
    enabled          = true
    rotation_days    = 15
    rotation_hours   = 6
    rotation_minutes = 30
    rotation_months  = 3
    rotation_years   = 2
  }
}
```

# ROTATING MAIN.TF MODULE REFERENCE
```
module "rotating" {
        source = "./modules/time/rotating"

        time_rotating_data = var.time_rotating_data
}
```

# ROTATING ROOT VARIABLES.TF
```
variable "rotating_data" {
  type = map(object({
    # Required
    enabled = bool

    # Optional Arguments
    rfc3339          = optional(string)
    rotation_days    = optional(number)
    rotation_hours   = optional(number)
    rotation_minutes = optional(number)
    rotation_months  = optional(number)
    rotation_years   = optional(number)
    triggers         = optional(list(object({
      type      = string
      attribute = string
    })))
  }))
  default = {}
}
```
