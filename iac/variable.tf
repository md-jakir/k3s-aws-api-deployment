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

variable "bastion_ami" {
  description = "AMI ID for bastion host."
  default     = "ami-0c2af51e265bd5e0e"  # Replace with appropriate AMI ID
}

variable "nginx_lb_ami" {
  description = "AMI ID for nginx load balancer."
  default     = "ami-0c2af51e265bd5e0e"  # Replace with appropriate AMI ID
}

variable "key_name" {
  description = "Name of the EC2 key pair."
  default     = "ec2_key"
}

variable "public_key_path" {
  description = "Path to the public key file."
  default     = "~/.ssh/aws_ec2_key"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {
    Project     = "K3sCluster"
    Environment = "Development"
  }
}