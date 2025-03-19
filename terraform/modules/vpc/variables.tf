variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "Availability zone to deploy resources"
  default     = "us-east-1a"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access (e.g., YOUR_IP/32)"
  type        = string
}
