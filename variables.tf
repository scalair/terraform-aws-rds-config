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

variable "vault_generic_secret_rds_credentials_path" {
  description = "Hashicorp Vault path to retrieve master 'username' and 'password'"
  type        = string
}