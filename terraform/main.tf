terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-east-1a"
}

module "s3" {
  source = "./modules/s3"
  
  bucket_name             = "your-unique-ai-video-bucket"  # Ensure this bucket name is globally unique.
  region                  = "us-east-1"
  vpc_id                  = module.vpc.vpc_id
  private_route_table_ids = module.vpc.private_route_table_ids
}
