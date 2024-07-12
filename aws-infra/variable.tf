variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "The availability zone to deploy resources in"
  default     = "ap-south-1a"
}

variable "http_port" {
  description = "Port number for HTTP"
  default     = 80
}

variable "https_port" {
  description = "Port number for HTTPS"
  default     = 443
}

variable "cidr_blocks" {
  description = "Allowed CIDR blocks for security group ingress"
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {
    Environment = "dev"
    Project     = "poridhi-vpc"
  }
}
