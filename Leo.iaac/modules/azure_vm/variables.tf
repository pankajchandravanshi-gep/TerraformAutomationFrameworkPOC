variable "resourcegroupname"{ default="" }
variable "resourcegrouplocation"{ default="" }

variable "tag_projectname_resourcegroup"{ default="SMART" }
variable "tag_environment_resourcegroup"{ default="DEV" }
variable "tag_department_resourcegroup"{ default="DEVOPS" }
variable "tag_resource_resourcegroup" { default="resourcegroup" }

variable "virtualnetworkname"{ default="" }
variable "virtualnetworkaddspace"{ default="" }

variable "tag_projectname_vnet"{ default="SMART" }
variable "tag_environment_vnet"{ default="DEV" }
variable "tag_department_vnet"{ default="DEVOPS" }
variable "tag_resource_vnet" { default="vnet" }

variable "subnetname"{ default="" }
variable "subnetaddprefixes"{ default="" }

variable "nsgname"{ default="" }

variable "tag_projectname_nsg"{ default="SMART" }
variable "tag_environment_nsg"{ default="DEV" }
variable "tag_department_nsg"{ default="DEVOPS" }
variable "tag_resource_nsg" { default="networksecuritygroup" }

variable "nicname" {default="" }
variable "nicipconfigname" {default="" }
variable "nicprivateipallocationtype" {default="" }

variable "tag_projectname_nic"{ default="SMART" }
variable "tag_environment_nic"{ default="DEV" }
variable "tag_department_nic"{ default="DEVOPS" }
variable "tag_resource_nic" { default="networkinterface" }

variable "azurevmname"{ default="" }
variable "azurevmconfigurations" { default="" }

variable "winimgpublisher"{ default="" }
variable "winimgoffer"{ default="" }
variable "winimgmodel"{ default="" }
variable "winimgversion"{ default="" }

variable "diskname" {default="" }
variable "accesstype"{default=""  }
variable "createdby" {default=""  }
variable "storagetype"{default=""   }

variable "compname" { default="" }
variable "userid"   { default="" }
variable "password" { default="" }

variable "tag_projectname_vm"{ default="SMART" }
variable "tag_environment_vm"{ default="DEV" }
variable "tag_department_vm"{ default="DEVOPS" }
variable "tag_resource_vm" { default="virtualmachine" }