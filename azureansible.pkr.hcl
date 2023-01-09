variable "vmsize" {
  description = "variable pour definir la taille de la VM"
  default = "Standard_B1S"
}

source "azure-arm" "imageubuntu" {
  subscription_id = "e5de38c5-e8ac-452b-9a84-28be57ea419c"
  tenant_id = "190ce420-b157-44ae-bc2f-69563baa5a3b"
  use_azure_cli_auth = true
  managed_image_name = "imageAzureAnsile"
  managed_image_resource_group_name = "azureansiblewesteurope"
  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "14.04.4-LTS"
  azure_tags = {
    dept = "engineering"
  }
  location = "WEST EUROPE"
  vm_size = var.vmsize
}

build {
  sources = ["source.azure-arm.imageubuntu"]
  provisioner "ansible" {
    playbook_file = "./projet/playbook.yml"
  }
}
