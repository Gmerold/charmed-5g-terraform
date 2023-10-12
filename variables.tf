variable "sdcore_model_name" {
  description = "Name of Juju model to deploy application to."
  type        = string
  default     = "test"
}

variable "channel" {
  description = "The channel to use when deploying a charm."
  type        = string
  default     = "stable"
}

variable "db_application_name" {
  description = "Name of the application providing the `database` integration endpoint."
  type        = string
  default     = "mongodb"
}
