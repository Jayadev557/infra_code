# Resource Group variables
variable "rg_name" {}
variable "location" {}

# Virtual Network variables
variable "vnet_name" {}
variable "vnet_address_space" {type = list(string)}

# FrontendSubnet variables
variable "f_subnet_name" {}
variable "subnet_addess_prefixes" {type = list(string)}

# BackendSubnet variables
variable "b_subnet_name" {}
variable "backend-subnet_addess_prefixes" {type = list(string)}


# Public IP variables
variable "fpip_name" {}
variable "pip_allocation_method" {}
variable "b_pip_name" {}

# FrontendVirtual Machine Variables
variable "nic_name" {}
variable "ip_config_name" {}
variable "pvt_ip_allocation" {}
variable "virtual_network_name" {}
variable "vm_name" {}
variable "vm_size" {}
variable "admin_password" {}
variable "admin_username" {}
variable "publisher" {}
variable "offer" {}
variable "sku" {}
variable "vm_version" {}

# BackendVirtual Machine Variables
variable "b_nic_name" {}
variable "b_ip_config_name" {}
variable "b_pvt_ip_allocation" {}
variable "b_virtual_network_name" {}
variable "b_vm_name" {}
variable "b_vm_size" {}
variable "b_admin_username" {}
variable "b_admin_password" {}
variable "b_publisher" {}
variable "b_offer" {}
variable "b_sku" {}
variable "b_vm_version" {}



# SQL server Variables
variable "server_name" {}
variable "server_version" {}
variable "server_login_id" {}
variable "server_password" {}

# SQL DB Variables
variable "sql_db_name" {}
variable "collation" {}
variable "license_type" {}
variable "db_size" {}
variable "sku_name" {}
variable "sql_server_name" {}


















