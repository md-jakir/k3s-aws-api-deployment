# Introduction
This repository contains a simple Python REST API built using the Flask framework. The API includes two endpoints: a GET endpoint returning a "Hello, World!" message and a POST endpoint accepting and returning JSON data. Additionally, the project includes a Dockerfile to containerize the API. The application is deployed in a lightweight K3s cluster. The cluster is configured in the AWS platform using Ansible script. The AWS resources are provisioned using the Terraform. This repository contains a detailed explanation and the codes are part of the infrastructure and application. 

# Provisioned AWS resources using Terraform
The repository has a directory named 'aws-infra', which contains all Terraform code. This IaC code provisions the following AWS resources. 
# VPC
A VPC is a virtual network dedicated to the AWS account. It allows us to launch AWS resources into a virtual network that we define. This virtual network closely resembles a traditional network that we might operate in our data center.
# Public Subnet
A public subnet is a subnet within the VPC that has a route to an Internet Gateway (IGW). This allows resources within the subnet to communicate directly with the internet. 
# Private Subnet
A private subnet is a subnet within your VPC that does not have a route to an Internet Gateway, meaning that resources within this subnet cannot directly access the internet. Typically, these subnets are used for backend resources like databases or application servers that do not need direct internet access.
