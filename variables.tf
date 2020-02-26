####################
# RDS remote state #
####################
variable "rds_bucket" {
  description = "Name of the bucket where RDS state is stored"
}

variable "rds_state_key" {
  description = "Key where the state file of the RDS is stored"
}

variable "rds_state_region" {
  description = "Region where the state file of the RDS is stored"
}

##############
# RDS Config #
##############

variable "extensions" {
  description = "List of Postgres extensions to enable"
  type        = list(string)
  default     = []
}

variable "readonly_user_enabled" {
  description = "If true, will create a user with SELECT permission to the provided database"
  type        = bool
  default     = false
}

variable "readonly_username" {
  description = "The name of the user that is created with readonly permission"
  type        = string
  default     = "readonlyuser"
}

variable "connection_limit" {
  description = "If this role can log in, this specifies how many concurrent connections the role can establish"
  type        = number
  default     = -1
}

variable "database" {
  description = "The database to grant privileges on"
  type        = string
  default     = ""
}

variable "vault_generic_secret_rds_credentials_path" {
  description = "Hashicorp Vault path to retrieve sensitive details"
  type        = string
}