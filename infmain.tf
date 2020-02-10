provider "azurerm" {
subscription_id = 
client_id =
lient_secret = 
tenant_id = 
}

module "yuvirg" {
    source               = "../rg"
    name                 = var.rgname
    location             = var.rglocation
}

module "yuvivnet" {
    source               = "../vnet"
    name                 = var.vnetname
    address_space       = var.address_space
    location             = var.rglocation 
    resource_group_name  = module.yuvirg.rgname

}

module "vnetsubnet" {
    source              = "../subnet"
    name           = var.subname
    address_prefix = var.address_prefix
    virtual_network_name = module.yuvivnet.vnetname
    resource_group_name = module.yuvirg.rgname
} 

module "yuvipip" { 
    source              = "../PIP"
     name                         = var.pipname
    location                     = var.rglocation
    resource_group_name          = module.yuvirg.rgname
    allocation_method            = var.allocation_method 
}

module "nsg" { 
    source              = "../NSG"
    name                = var.Nsgname
    location            = var.rglocation
    resource_group_name = module.yuvirg.rgname
    
    
        rule_name                       = var.rule_name
        priority                   = var.priority
        direction                  = var.direction
        access                     = var.access
        protocoltcp                = var.protocoltcp
        source_port_range          = var.source_port_range
        destination_port_range     = var.destination_port_range
        source_address_prefix      = var.source_address_prefix
        destination_address_prefix = var.destination_address_prefix 
    
} 
module "mynic1" { 
    source                        = "../NIC"
    nicname                        = var.nicname
    location                    = var.rglocation
    resource_group_name         = module.yuvirg.rgname
    network_security_group_id   = module.nsg.nsgid

    
        NicConfiguration_name         = var.NicConfiguration_name
        subnet_id                     = module.vnetsubnet.subnet1id
        private_ip_address_allocation = var.private_ip_address_allocation
        public_ip_address_id          = module.yuvipip.pipid
    
}

resource "random_id" "randomId" {
    keepers = {
        # Generate a new ID only when a new resource group is defined
        resource_group = module.yuvirg.rgname
    }
    
    byte_length = 8
}

module "yuviacc" {
    source = "../sacc"
    accname                      = var.accname
    resource_group_name         = module.yuvirg.rgname
    location                    = var.rglocation
    account_replication_type    = var.account_replication_type
    account_tier                = var.account_tier

} 
module "yuvivm1" {
    source = "../vm"
    vmname                  = var.vmname
    location              = var.rglocation
    resource_group_name   = module.yuvirg.rgname
    network_interface_ids = [module.mynic1.nicid]
    vm_size               = var.vm_size

    
        osdiskname              = var.osdiskname
        caching           = var.caching
        create_option     = var.create_option
        managed_disk_type = var.managed_disk_type
    

    
        publisher = var.publisher
        offer     = var.offer
        sku       = var.sku
        vmversion   = var.vmversion
    

    
        computer_name  = var.computer_name
        admin_username = var.admin_username
	    admin_password = var.admin_password
    
    
        disable_password_authentication = var.disable_password_authentication
        
    

   
        enabled     = var.enabled
        storage_uri = module.yuviacc.storageurl
    

    

}
