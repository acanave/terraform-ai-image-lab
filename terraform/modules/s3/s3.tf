# Create the S3 Bucket
resource "aws_s3_bucket" "ai_videos" {
  bucket = var.bucket_name

  tags = {
    Name = "ai-video-lab-s3-bucket"
  }
}

# Create the VPC Endpoint for S3 so that traffic stays within the AWS network
resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  route_table_ids   = var.private_route_table_ids

  tags = {
    Name = "ai-video-lab-s3-endpoint"
  }
}
