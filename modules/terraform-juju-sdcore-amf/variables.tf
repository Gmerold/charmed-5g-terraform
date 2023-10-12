variable "model_name" {
  description = "Name of Juju model to deploy application to."
  type        = string
  default     = ""
}

variable "channel" {
  description = "The channel to use when deploying a charm."
  type        = string
  default     = "stable"
}

variable "db_application_name" {
  description = "The name of the application providing the `database` endpoint."
  type        = string
  default     = "mongodb-k8s"
}

variable "nrf_application_name" {
  description = "The name of the application providing the `fiveg_nrf` endpoint."
  type        = string
  default     = "nrf"
}
