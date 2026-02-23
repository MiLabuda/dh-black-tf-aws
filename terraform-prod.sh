#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Path to the variables file
VAR_FILE="params/prod/terraform.tfvars"

# Check if the variables file exists
if [ ! -f "$VAR_FILE" ]; then
    echo "ERROR: Variable file $VAR_FILE not found!"
    exit 1
fi

echo "1. Initializing Terraform..."
terraform init -input=false

echo "2. Creating execution plan..."
# -input=false prevents Terraform from asking for variable values via CLI
terraform plan -var-file="$VAR_FILE" -out=tfplan -input=false

echo "3. Applying changes automatically..."
# When providing a plan file, Terraform applies it without asking for confirmation
terraform apply -input=false tfplan

echo "4. Cleaning up..."
rm tfplan

echo "DONE: Changes have been successfully applied."