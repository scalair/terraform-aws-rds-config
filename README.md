# Terraform AWS RDS Config

Terraform module which configures an existing RDS **Postgres** database.
Important: the master credentials are retrieve in an Hashicorp Vault.

Currently the script can:

- Create extensions
- Create roles
- Grant permissions to roles

An example Terragrunt output is provided below:

```hcl
inputs = {
  roles = [
    {
      name = "readonly_user",
      login = true, // if true, the role will be a user
      password = "", // if empty string, password will be generated
      connection_limit = 10,
      roles = ["pg_read_all_stats"],
      grants = [{
        database = "mydb",
        schema = "public",
        object_type = "table",
        privileges = ["SELECT"],
      }],
    },
  ]

  extensions = ["unaccent", "pg_stat_statements"]
}
```