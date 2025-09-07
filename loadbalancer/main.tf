data "azurerm_network_interface" "example" {
  name                = "my-nic"
  resource_group_name = "rg121"
}
variable "nsgname" {
  
}
variable "rg" {
  
}
data "azurerm_network_security_group" "nsg"{

  name=var.nsgname
  resource_group_name=var.rg
}
# 1. Public IP for the Load Balancer
resource "azurerm_public_ip" "lb_public_ip" {
  name                = "my-lb-public-ip"
  location            = "westus2"
  resource_group_name = var.rg

  allocation_method   = "Static"
  sku                 = "Standard"
}

# 2. Load Balancer
resource "azurerm_lb" "lb" {
  name                = "my-lb"
  location            = "westus2"
  resource_group_name = var.rg
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "LoadBalancerFrontEnd"
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}

# 3. Backend Address Pool
resource "azurerm_lb_backend_address_pool" "lb_backend_pool" {
  name                = "my-backend-pool"
  //resource_group_name = "rg123"
  loadbalancer_id     = azurerm_lb.lb.id
}

# 4. Health Probe
resource "azurerm_lb_probe" "lb_probe" {
  name                = "http-probe"
  //resource_group_name = "rg123"
  loadbalancer_id     = azurerm_lb.lb.id

  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
}

# 5. Load Balancing Rule
resource "azurerm_lb_rule" "lb_rule" {
  name                           = "http-rule"
  //resource_group_name            = "rg123"
  loadbalancer_id                = azurerm_lb.lb.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "LoadBalancerFrontEnd"
  //backend_address_pool_id        = azurerm_lb_backend_address_pool.lb_backend_pool.id
  //probe_id                       = azurerm_lb_probe.lb_probe.id
}

//6. Associate NICs (optional if you already have them)
resource "azurerm_network_interface_backend_address_pool_association" "nic_assoc" {
  network_interface_id    = data.azurerm_network_interface.example.id
  ip_configuration_name   = "internal"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_pool.id
}
resource "azurerm_network_interface_security_group_association" "example_nsg_nic_association" {
  network_interface_id      = data.azurerm_network_interface.example.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}