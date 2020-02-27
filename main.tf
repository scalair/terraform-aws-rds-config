resource "postgresql_extension" "pg_extension" {
  for_each = toset(var.extensions)
  name = each.value
}

resource "random_password" "pg_password" {
  for_each = {
    for role in var.roles: role.name => role
  }

  length  = 24
  special = false
  keepers = {
    name = each.key
  }
}

resource "postgresql_role" "pg_role" {
  for_each = {
    for role in var.roles: role.name => role
  }

  name             = each.key
  login            = each.value.login
  password         = each.value.password == "" ? random_password.pg_password[each.key].result: each.value.password
  connection_limit = each.value.connection_limit
  roles            = each.value.roles
}

locals {
  grant_list = flatten([
    for role in var.roles: [
      for grant in role.grants: {
        role_name = role.name
        grant = grant
      }
    ]
  ])
}

resource postgresql_grant "pg_grant" {
  for_each = {
    for grant in local.grant_list: grant.role_name => grant.grant
  }

  role        = each.key
  database    = each.value.database
  schema      = each.value.schema
  object_type = each.value.object_type
  privileges  = each.value.privileges

  depends_on = [
    postgresql_role.pg_role
  ]
}