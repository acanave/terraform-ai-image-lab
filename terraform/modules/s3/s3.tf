resource "aws_s3_bucket" "ai_videos" {
  bucket = var.bucket_name  # Make sure your root-level or module-level variables.tf has `bucket_name`

  tags = {
    Name = "ai-video-lab-s3-bucket"
  }

  # If you want to enable default server-side encryption, you can define it here.
  # Make sure your IAM policy includes s3:PutEncryptionConfiguration if you do:
  # server_side_encryption_configuration {
  #   rule {
  #     apply_server_side_encryption_by_default {
  #       sse_algorithm = "AES256"
  #     }
  #   }
  # }
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = var.vpc_id
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  # For a gateway endpoint, specify the route_table_ids for private subnets
  route_table_ids = var.private_route_table_ids

  tags = {
    Name = "ai-video-lab-s3-endpoint"
  }
}
