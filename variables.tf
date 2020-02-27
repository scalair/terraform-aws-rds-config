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

variable "roles" {
  description = "A list of roles to create"
  type = list(object({
    name = string,
    login = bool,
    password = string,
    connection_limit = number,
    roles = list(string),
    grants = list(object({
      database = string,
      schema = string,
      object_type = string,
      privileges = list(string)
    }))
  }))
  default = []
}

variable "vault_generic_secret_rds_credentials_path" {
  description = "Hashicorp Vault path to retrieve sensitive details"
  type        = string
}