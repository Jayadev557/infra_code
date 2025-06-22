resource "azurerm_mssql_server" "s-serverblock" {
  name                         = var.server_name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.server_login_id
  administrator_login_password = var.server_password
 }