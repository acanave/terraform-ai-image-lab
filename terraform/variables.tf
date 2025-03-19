variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access (e.g., your public IP with /32)"
  type        = string
  # Optionally, you can provide a default value here,
  # but it’s common to leave it empty and supply it via terraform.tfvars or command line.
  # For example:
  # default = "203.0.113.45/32"
}

variable "s3_bucket_name" {
  description = "The globally unique name for the S3 bucket"
  type        = string
  default     = "your-unique-ai-video-bucket"
}
