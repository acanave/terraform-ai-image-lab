variable "bucket_name" {
  description = "The name for the S3 bucket (must be globally unique)"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# Variables to receive the VPC ID and the private route table IDs for the endpoint
variable "vpc_id" {
  description = "The ID of the VPC where the endpoint will be created"
  type        = string
}

variable "private_route_table_ids" {
  description = "List of private route table IDs for the VPC endpoint"
  type        = list(string)
}
