resource "postgresql_extension" "pg_extension" {
  for_each = toset(var.extensions)
  name = each.value
}

resource "random_password" "pg_password" {
  length  = 24
  special = false
  keepers = {
    name     = var.readonly_username
    database = var.database
  }
}

resource "postgresql_role" "pg_role" {
  count = var.readonly_user_enabled ? 1 : 0

  login            = true
  name             = var.readonly_username
  password         = random_password.pg_password.result
  connection_limit = var.connection_limit
  roles            = ["pg_read_all_stats"]
}

resource postgresql_grant "pg_grant" {
  count = var.readonly_user_enabled ? 1 : 0

  role        = var.readonly_username
  database    = var.database
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT"]

  depends_on = [
    postgresql_role.pg_role,
  ]
}