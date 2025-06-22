resource "azurerm_network_interface" "nicblock" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = data.azurerm_subnet.datablcok.id
    private_ip_address_allocation = var.pvt_ip_allocation
    public_ip_address_id          = data.azurerm_public_ip.pip1block.id
  }
}
resource "azurerm_linux_virtual_machine" "vmblock" {
  name                            = var.vm_name
  resource_group_name             = var.rg_name
  size                            = var.vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  location                        = var.location
  network_interface_ids           = [azurerm_network_interface.nicblock.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.vm_version
  }
}
