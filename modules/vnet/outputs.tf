output "vnet_id" {
  value = azurerm_virtual_network.azvnet.id
}

#output "subnet_ids" {
#  value = { for k, v in azurerm_subnet.azsubnet : k => v.id }
#}

output "subnet_id" {
  value = azurerm_subnet.azsubnet["web"].id
}