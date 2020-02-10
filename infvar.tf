variable "rgname" {
    default = "yuvirg" 
} 
variable "rglocation" {
    default = "eastasia" 
} 
variable "address_space" {
    default = "10.1.0.0/16" 
} 
variable "vnetname" {
    default = "yuvivnet" 
} 
variable "subname" {
    default = "pubsubnet"
} 
variable "address_prefix" {
    default = "10.1.0.0/24"
}
variable "pipname" {
    default = "publicip"
} 
variable "allocation_method" {
    default = "Dynamic"
} 
variable "Nsgname" {
    default = "nsg1"
}

variable "rule_name" {
    default = "SSH"
} 
variable "priority" {
    default = "1001"
} 
variable "direction" {
    default = "Inbound"
} 
variable "access" {
    default = "Allow"
} 
variable "protocoltcp" {
    default = "Tcp"
} 
variable "source_port_range" {
    default = "*"
} 
variable "destination_port_range" {
    default = "22"
} 
variable "source_address_prefix" {
    default = "*"
} 
variable "destination_address_prefix" {
    default = "*"
} 
variable "nicname" {
        default = "mynic1"
} 
variable "NicConfiguration_name" {
    default = "NicConfiguration"
} 

variable "private_ip_address_allocation" {
    default = "Dynamic"
} 
variable "accname" {
    default = "yuviaac"
} 
variable "account_replication_type" {
    default = "LRS"
} 
variable "account_tier" {
    default = "Standard"
} 
variable "vmname" {
    default = "yuvivm1"
} 
variable "vm_size" {
    default = "Standard_DS1_v2"
} 
variable "osdiskname" {
    default = "OsDisk1"
} 
variable "caching" {
    default = "ReadWrite"
} 
variable "create_option" {
    default = "FromImage"
} 
variable "managed_disk_type" {
    default = "Premium_LRS"
} 
variable "publisher" {
    default = "Canonical"
} 
variable "offer" {
    default = "UbuntuServer"
} 
variable "sku" {
    default = "16.04.0-LTS"
} 
variable "vmversion" {
    default = "latest"
} 
variable "computer_name" {
    default = "yuvivm1"
} 
variable "admin_username" {
    default = "yuvi001"
} 
variable "admin_password" {
    default = "Solyan@12345"
} 
variable "disable_password_authentication" {
    default = "false"
} 
variable "enabled" {
    default = "true"
} 

