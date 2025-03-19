output "bucket_id" {
  value = aws_s3_bucket.ai_videos.id
}

output "s3_endpoint_id" {
  value = aws_vpc_endpoint.s3_endpoint.id
}
