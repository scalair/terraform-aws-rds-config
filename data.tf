data "terraform_remote_state" "rds" {
  backend = "s3"

  config = {
    region = var.rds_state_region
    bucket = var.rds_bucket
    key    = var.rds_state_key
  }
}

data "vault_generic_secret" "rds_credentials" {
  path = var.vault_generic_secret_rds_credentials_path
}