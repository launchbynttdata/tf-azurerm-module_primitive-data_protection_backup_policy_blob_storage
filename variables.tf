variable "policy_name" {
  type = string
}

variable "vault_id" {
  type = string
}

variable "backup_repeating_time_intervals" {
  type    = list(string)
  default = null
}

variable "operational_default_retention_duration" {
  type    = string
  default = null
}

variable "vault_default_retention_duration" {
  type    = string
  default = null
}

variable "time_zone" {
  type    = string
  default = null
}

variable "retention_rules" {
  type = list(object({
    name     = string
    priority = number

    life_cycle = object({
      data_store_type = string
      duration        = string
    })

    criteria = object({
      absolute_criteria      = optional(string)
      days_of_month          = optional(list(number))
      days_of_week           = optional(list(string))
      months_of_year         = optional(list(string))
      scheduled_backup_times = optional(list(string))
      weeks_of_month         = optional(list(string))
    })
  }))

  default = []
}

variable "timeouts" {
  type = object({
    create = optional(string, "30m")
    read   = optional(string, "5m")
    delete = optional(string, "30m")
  })

  default = {}
}
