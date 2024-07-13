# AWS Infrastructure Setup
First I created a variable.tf. The variable.tf file holds the data like region name, VPC CIDR block, subnet name, and so on these variables are called in main.tf file to create resources according to the instructions. 
Here, also output.tf file is placed to get the resource IDs once creation is done. These resource IDs can be called to the other program code if needed. 

The main.tf file contains the provider block and resource block. The provider block is AWS which is installed when the terraform init command is executed. The providers are defined in the IaC code and will be downloaded in .terraform folker in a local machine. 

# Terraform commands
    1. $ terraform init 
    2. $ terraform plan
    3. $ terraform validate
    4. $ terraform apply
