module "resource_group" {
  source   = "../azurerm_resource_group"
  rg_name  = var.rg_name
  location = var.location
}

module "vitrual_network" {
  depends_on         = [module.resource_group]
  source             = "../azurerm_virtual_network"
  vnet_name          = var.vnet_name
  location           = var.location
  rg_name            = var.rg_name
  vnet_address_space = var.vnet_address_space
}

module "frontend-subnet" {
  depends_on             = [module.vitrual_network]
  source                 = "../azurerm_subnet"
  subnet_name            = var.f_subnet_name
  rg_name                = var.rg_name
  vnet_name              = var.vnet_name
  subnet_addess_prefixes = var.subnet_addess_prefixes
}

module "backend-subnet" {
  depends_on             = [module.vitrual_network]
  source                 = "../azurerm_subnet"
  subnet_name            = var.b_subnet_name
  rg_name                = var.rg_name
  vnet_name              = var.vnet_name
  subnet_addess_prefixes = var.backend-subnet_addess_prefixes
}

module "frontend-public-ip" {
  source                = "../azurerm_pip"
  pip_name              = var.fpip_name
  rg_name               = var.rg_name
  location              = var.location
  pip_allocation_method = var.pip_allocation_method
}

module "backend-public-ip" {
  source                = "../azurerm_pip"
  pip_name              = var.b_pip_name
  rg_name               = var.rg_name
  location              = var.location
  pip_allocation_method = var.pip_allocation_method
}

module "front-virtual_machine" {
  depends_on           = [module.frontend-subnet]
  source               = "../azurerm_virtual_machine"
  nic_name             = var.nic_name
  location             = var.location
  ip_config_name       = var.ip_config_name
  pvt_ip_allocation    = var.pvt_ip_allocation
  pip_name             = var.fpip_name
  rg_name              = var.rg_name
  subnet_name          = var.f_subnet_name
  virtual_network_name = var.virtual_network_name
  vm_name              = var.vm_name
  vm_size              = var.vm_size
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  publisher            = var.publisher
  offer                = var.offer
  sku                  = var.sku
  vm_version           = var.vm_version
}

module "backend-virtual_machine" {
  depends_on           = [module.backend-subnet]
  source               = "../azurerm_virtual_machine"
  nic_name             = var.b_nic_name
  ip_config_name       = var.b_ip_config_name
  pvt_ip_allocation    = var.b_pvt_ip_allocation
  virtual_network_name = var.b_virtual_network_name
  vm_name              = var.b_vm_name
  vm_size              = var.b_vm_size
  admin_username       = var.b_admin_username
  admin_password       = var.b_admin_password
  publisher            = var.b_publisher
  offer                = var.b_offer
  sku                  = var.b_sku
  vm_version           = var.b_vm_version
  subnet_name          = var.b_subnet_name
  rg_name              = var.rg_name
  location             = var.location
  pip_name             = var.b_pip_name
}

module "sql-server" {
  depends_on      = [module.resource_group]
  source          = "../azurerm_sql_server"
  server_name     = var.server_name
  rg_name         = var.rg_name
  server_version  = var.server_version
  location        = var.location
  server_login_id = var.server_login_id
  server_password = var.server_password
}

module "sql_db_block" {
  depends_on      = [module.sql-server]
  source          = "../azurerm_sql_db"
  sql_db_name     = var.sql_db_name
  collation       = var.collation
  license_type    = var.license_type
  db_size         = var.db_size
  sku_name        = var.sku_name
  rg_name         = var.rg_name
  sql_server_name = var.sql_server_name
}
