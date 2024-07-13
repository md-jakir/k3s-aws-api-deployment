provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region to deploy resources."
  default     = "ap-south-1"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets."
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets."
  default     = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]
}

variable "k3s_version" {
  description = "Version of k3s to install."
  default     = "latest"  # or specify a specific version like "v1.23.2+k3s1"
}

variable "k3s_token" {
  description = "Token for agent nodes to join the master."
  default     = "your_token"
}

variable "bastion_ami" {
  description = "AMI ID for bastion host."
  default     = "ami-0c2af51e265bd5e0e"  # Replace with appropriate AMI ID
}

variable "nginx_lb_ami" {
  description = "AMI ID for nginx load balancer."
  default     = "ami-0c2af51e265bd5e0e"  # Replace with appropriate AMI ID
}