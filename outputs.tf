output "role_credentials" {
    value = { for role in var.roles: role.name => random_password.pg_password[role.name].result }
}

output "endpoint" {
    value = format("%s:%s", data.terraform_remote_state.rds.outputs.db_instance_address, data.terraform_remote_state.rds.outputs.db_instance_port)
}