resource "azurerm_resource_group" "rg" {
   name     = "TerraformTest-RG"
   location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {                   
  name                = "TerraformTest-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.1.0.0/26"]
}

resource "azurerm_subnet" "subnet" {							
  name                 = "TerraformTest-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = ["10.1.0.0/28"]
}

resource "azurerm_network_security_group" "nsg" {
   name                = "TerraformTest-SG"
   location            = azurerm_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_interface" "nic" {
  name                = "TerraformTest-NIC"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "TerraformTest-ipconfig"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    }
 }