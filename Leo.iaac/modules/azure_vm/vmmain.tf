terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.12"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  
   name     = var.resourcegroupname
   location = var.resourcegrouplocation
tags = {
    projectName = var.tag_projectname_resourcegroup
    environment = var.tag_environment_resourcegroup
    documentTeam = var.tag_department_resourcegroup
    resourceType= var.tag_resource_resourcegroup
  }
}

resource "azurerm_virtual_network" "vnet" {  
  
  name                = var.virtualnetworkname
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.virtualnetworkaddspace
  tags = {
    projectName = var.tag_projectname_vnet
    environment = var.tag_environment_vnet
    documentTeam = var.tag_department_vnet
    resourceType= var.tag_resource_vnet
  }
}

resource "azurerm_subnet" "subnet" {							
  name                 = var.subnetname
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes       = var.subnetaddprefixes
}

resource "azurerm_network_security_group" "nsg" {
   name                = var.nsgname
   location            = azurerm_resource_group.rg.location
   resource_group_name = azurerm_resource_group.rg.name
 tags = {
    projectName = var.tag_projectname_nsg
    environment = var.tag_environment_nsg
    documentTeam = var.tag_department_nsg
    resourceType= var.tag_resource_nsg
  }
}

resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nicipconfigname
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.nicprivateipallocationtype
    }
  
   tags = {
    projectName = "${var.tag_projectname_nic}"
    environment = "${var.tag_environment_nic}"
    documentTeam = "${var.tag_department_nic}"
    resourceType= "${var.tag_resource_nic}"
  }
}


resource "azurerm_virtual_machine" "azurevm"  {
name                  = var.azurevmname
location              = azurerm_resource_group.rg.location
resource_group_name   = azurerm_resource_group.rg.name
network_interface_ids = [azurerm_network_interface.nic.id]
vm_size               = var.azurevmconfigurations
  
  storage_image_reference {
    
    publisher   = var.winimgpublisher
    offer       = var.winimgoffer
    sku         = var.winimgmodel
    version     = var.winimgversion
    } 
  
    storage_os_disk { 
    name              =  var.diskname
    caching           =  var.accesstype    
    create_option     =  var.createdby
    managed_disk_type =  var.storagetype
    }
  
    os_profile {
    computer_name  =  var.compname
    admin_username =  var.userid
    admin_password =  var.password
  }

  os_profile_windows_config {
    provision_vm_agent = true
  }
  
     tags = {
    projectName  = var.tag_projectname_vm
    environment  = var.tag_environment_vm
    documentTeam = var.tag_department_vm
    resourceType = var.tag_resource_vm
  }
}
