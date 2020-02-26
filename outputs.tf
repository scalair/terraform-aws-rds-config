output "readonly_username" {
    value = var.readonly_username
}

output "readonly_password" {
    value = random_password.pg_password.result
}

output "database" {
    value = var.database
}

output "endpoint" {
    value = format("%s:%s", data.terraform_remote_state.rds.outputs.db_instance_address, data.terraform_remote_state.rds.outputs.db_instance_port)
}