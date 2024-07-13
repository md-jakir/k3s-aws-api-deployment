# Introduction
This repository contains a simple Python REST API built using the Flask framework. The API includes two endpoints: a GET endpoint returning a "Hello, World!" message and a POST endpoint accepting and returning JSON data. Additionally, the project includes a Dockerfile to containerize the API. The application is deployed in a lightweight K3s cluster. The cluster is configured in the AWS platform using Ansible script. The AWS resources are provisioned using the Terraform. This repository contains a detailed explanation and the codes are part of the infrastructure and application. 

# Provisioned AWS resources using Terraform
The repository has a directory named 'aws-infra', which contains all Terraform code. This IaC code provisions the following AWS resources. 
# VPC
A VPC is a virtual network dedicated to the AWS account. It allows us to launch AWS resources into a virtual network that we define. This virtual network closely resembles a traditional network that we might operate in our data center.
# Public Subnet
A public subnet is a subnet within the VPC that has a route to an Internet Gateway (IGW). This allows resources within the subnet to communicate directly with the internet. 
# Private Subnet
A private subnet is a subnet within your VPC that does not have a route to an Internet Gateway, meaning that resources within this subnet cannot directly access the Internet. Typically, these subnets are used for backend resources like databases or application servers that do not need direct internet access.
# NAT Gateway
A NAT (Network Address Translation) Gateway allows instances in a private subnet to connect to the Internet or other AWS services but prevents the Internet from initiating connections with those instances. The NAT Gateway is placed in a public subnet to route traffic from private subnets to the internet securely.
# K3s Cluster setup
K3s cluster was set up with one master node and two agent nodes. When infrastructure was built with Terraform IaC. In Terraform IaC there is a output.tf file which will provide the VPC ID, private subnet ID, and public subnet ID. I also redirected a JSON output of output.tf file to a separate file so that I can map the variable to the Ansible code. The Ansible playbook provisions EC2 instances installing K3s packages and adds the agent instances with the master node. 
# Python Flask App
It is just a simple Python REST API code made with the Flask framework which has two endpoints one is for the GET method to return a simple "Hello, World!" message. Another one is for the POST method which accepts a JSON payload and returns the same payload in the response.
