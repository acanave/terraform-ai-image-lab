provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-east-1a"

}

module "s3" {
  source                  = "./modules/s3"
  bucket_name             = var.bucket_name
  region                  = var.aws_region
  vpc_id                  = module.vpc.vpc_id
  private_route_table_ids = module.vpc.private_route_table_ids
}

module "compute" {
  source               = "./modules/compute"
  ami                  = var.ami
  instance_type        = var.instance_type
  private_subnet_id    = module.vpc.private_subnet_id
  iam_instance_profile = module.iam.instance_profile_name
  security_group_ids   = [module.vpc.ec2_sg_id]
}
module "iam" {
  source     = "./modules/iam"
  bucket_arn = module.s3.bucket_arn
}
