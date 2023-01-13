#!/bin/bash

echo "Starting Program"

echo "Creating image with Packer"
echo "Configuring with Ansible playbook"

packer build testazure.pkr.hcl

echo "Build done"

echo "Deploy VM with Terraform"

terraform init

terraform apply

echo "Deployment done"

az vm show -d -g example-resources -n example-vm --query publicIps -o tsv