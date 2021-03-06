provider "postgresql" {
  host            = data.terraform_remote_state.rds.outputs.db_instance_address
  port            = data.terraform_remote_state.rds.outputs.db_instance_port
  database        = data.terraform_remote_state.rds.outputs.db_instance_name
  username        = data.vault_generic_secret.rds_credentials.data["username"]
  password        = data.vault_generic_secret.rds_credentials.data["password"]
  superuser       = false
  sslmode         = "disable"
  connect_timeout = 60
}

#provider "aws" {
#  version = "~> 2.0"
#}

provider "vault" {
  version = "~> 2.0"
}
