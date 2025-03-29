variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket"
  type        = string
  default     = "my-unique-ai-video-bucket-1234" # Replace with your unique name
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_route_table_ids" {
  description = "List of private route table IDs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for the compute module"
  type        = string
  default     = "g4dn.xlarge"
}

variable "ami" {
  description = "The AMI ID for the GPU-enabled EC2 instance (Deep Learning AMI)"
  type        = string
  # No default provided; supply this via terraform.tfvars.
}