variable "instance_type" {
  description = "EC2 instance type for text-to-image deployment"
  type        = string
  default     = "g4dn.xlarge"
}

variable "ami" {
  description = "ami-0349dc82277d50797"
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

variable "default_user" {
  description = "Default OS user for the instance (e.g., 'ubuntu' or 'ssm-user')"
  type        = string
  default     = "ubuntu"
}
