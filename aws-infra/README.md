# AWS Infrastructure Setup
First I created a variable.tf. The variable.tf file holds the data like region name, VPC CIDR block, subnet name, and so on these variables are called in main.tf file to create resources according to the instructions. 
Here, also output.tf file is placed to get the resource IDs once creation is done. These resource IDs can be called to the other program code if needed. 
