variable "instance_type" {
  description = "EC2 instance type for text-to-image deployment"
  type        = string
  default     = "g4dn.xlarge"
}

variable "ami" {
  description = "The AMI ID to use for the instance (must be GPU-enabled)"
  type        = string
  # Optionally, you can leave this without a default and supply it externally.
}

variable "private_subnet_id" {
  description = "The ID of the private subnet where the EC2 instance will be launched"
  type        = string
}

variable "iam_instance_profile" {
  description = "The IAM instance profile name for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "A list of security group IDs to attach to the EC2 instance"
  type        = list(string)
}
