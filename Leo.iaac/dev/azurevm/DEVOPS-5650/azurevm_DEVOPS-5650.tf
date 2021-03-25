terraform {
  backend "azurerm" {
    storage_account_name  = "#{Storage_Account_Name}"
    container_name        = "#{Container_Name}"
    access_key            = "#{Access_Key}"
    key                   = "azurevm_DEVOPS-5650.tfstate"
  }
}

module "azurevm_DEVOPS-5650"{
  
source		= "../../modules/azure_vm"
  
 resourcegroupname  =  azurerm_resource_group.rg.name
 resourcegrouplocation  =  azurerm_resource_group.rg.location

 tag_projectname_resourcegroup  =  "${local.project_name}"  
 tag_environment_resourcegroup  =  "${local.env}" 
 tag_department_resourcegroup   =  "${local.department}"  
 tag_resource_resourcegroup     =  "resourcegroup" 

 virtualnetworkname  =  azurerm_virtual_network.vnet.name
 virtualnetworkaddspace  = azurerm_virtual_network.vnet.address_space 

 tag_projectname_vnet  = "${local.project_name}"   
 tag_environment_vnet  = "${local.env}" 
 tag_department_vnet  = "${local.department}"  
 tag_resource_vnet   = "virtualnetwork"

 subnetname  =  azurerm_subnet.subnet.name
 subnetaddprefixes  =  azurerm_subnet.subnet.address_prefix
    
 nsgname  =  azurerm_network_security_group.nsg.name

 tag_projectname_nsg  = "${local.project_name}"   
 tag_environment_nsg  = "${local.env}"  
 tag_department_nsg  = "${local.department}" 
 tag_resource_nsg   = "networksecuritygroup"  
  
 nicname = azurerm_network_interface.nic.name
 nicipconfigname = azurerm_network_interface.nic.ip_configuration.name
 nicprivateipallocationtype = azurerm_network_interface.nic.ip_configuration.private_ip_address_allocation
  
 tag_projectname_nic     = "${local.project_name}"   
 tag_environment_nic     = "${local.env}"  
 tag_department_nic      = "${local.department}" 
 tag_resource_nic        = "networkinterface" 

 azurevmname             =  "${local.project_name}-${local.env}-${local.department}-TerraformTest-VM"
 azurevmconfigurations   = "Standard_D2s_v3"
  
 winimgpublisher   = "MicrosoftWindowsServer"
 winimgoffer       = "WindowsServer" 
 winimgmodel       = "2019-Datacenter" 
 winimgversion     = "latest"
  
 diskname         = "OS-Disk"
 accesstype       = "ReadWrite" 
 createdby        = "FromImage" 
 storagetype      = "Standard_LRS"  
  
 compname = "${local.project_name}${local.env}${local.department}"
 userid    =  "${local.admin_username}" 
 password  =  "${local.admin_password}"
  
 tag_projectname_vm  = "${local.project_name}"  
 tag_environment_vm  = "${local.env}"  
 tag_department_vm   = "${local.department}"  
 tag_resource_vm     = "VirtualMachine" 
  
  }