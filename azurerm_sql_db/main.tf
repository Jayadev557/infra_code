resource "azurerm_mssql_database" "s-dbblock" {
  name         = var.sql_db_name
  server_id    = data.azurerm_mssql_server.serverdatablock.id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.db_size
  sku_name     = var.sku_name
}
