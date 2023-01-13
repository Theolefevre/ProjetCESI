variable "vmsize" {
  description = "variable pour definir la taille de la VM"
  default = "Standard_B1S"
}

source "azure-arm" "imageubuntu" {
  subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  tenant_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  use_azure_cli_auth = true
  managed_image_name = "imageWordpress"
  managed_image_resource_group_name = "groupWordpress"
  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "18.04-lts"
  azure_tags = {
    dept = "engineering"
  }
  location = "WEST EUROPE"
  vm_size = var.vmsize
}

build {
  sources = ["source.azure-arm.imageubuntu"]
  provisioner "ansible" {
    playbook_file = "playbook.yml"
  }
}
