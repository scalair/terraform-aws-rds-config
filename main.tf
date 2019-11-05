resource "postgresql_extension" "pg_extension" {
  for_each = toset(var.extensions)
  name = each.value
}