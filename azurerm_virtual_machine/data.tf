data "azurerm_public_ip" "pip1block" {
  name                = var.pip_name
  resource_group_name = var.rg_name
}
data "azurerm_subnet" "datablcok" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.rg_name
}
