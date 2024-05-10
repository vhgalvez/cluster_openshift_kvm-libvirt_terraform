#!/bin/bash

# Define the directory containing your Terraform configuration files
TERRAFORM_DIR="/home/victory/infra_code/cluster_openshift_kvm-libvirt_terraform/mv_02-cloud-init_cluster_kvm_rockylinux_libvirt_terraform"

# Display the tree structure of the Terraform directory
echo "Displaying directory tree for Terraform configuration files:"
tree -lh "$TERRAFORM_DIR"

# Display the current working directory
echo "Current working directory:"
pwd

# List all virtual machines and their states
echo "Listing all virtual machines:"
sudo virsh list --all

# List of files to be concatenated and displayed
FILES=("main.tf" "meta-data" "outputs.tf" "provider.tf" "README.md" "terraform.tfvars" "user-data" "vars.tf")

# Loop through each file and display its contents
for file in "${FILES[@]}"; do
    echo "============================================================"
    echo "Contents of $file:"
    echo "============================================================"
    cat "$TERRAFORM_DIR/$file"
    echo ""  # Adds an empty line for better readability between files
done