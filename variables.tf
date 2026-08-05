variable "policy_name" {
  description = "Name of the Blob Storage backup policy."
  type        = string
}

variable "vault_id" {
  description = "Resource ID of the Data Protection backup vault."
  type        = string
}

variable "backup_repeating_time_intervals" {
  description = "Repeating time intervals that define the backup schedule."
  type        = list(string)
  default     = null
}

variable "operational_default_retention_duration" {
  description = "Default retention duration for backups in the operational store."
  type        = string
  default     = null
}

variable "vault_default_retention_duration" {
  description = "Default retention duration for backups in the vault store."
  type        = string
  default     = null
}

variable "time_zone" {
  description = "Time zone used by the backup schedule."
  type        = string
  default     = null
}

variable "retention_rules" {
  description = "Retention rules that define how backup instances are retained."
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
  description = "Timeouts for creating, reading, and deleting the backup policy."
  type = object({
    create = optional(string, "30m")
    read   = optional(string, "5m")
    delete = optional(string, "30m")
  })

  default = {}
}
