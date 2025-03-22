variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "GPU‑enabled AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for compute"
  type        = string
  default     = "g4dn.xlarge"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access (e.g., your public IP/32)"
  type        = string
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name"
  type        = string
  default     = "your-unique-ai-video-bucket"
}
