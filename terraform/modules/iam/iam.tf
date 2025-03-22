resource "aws_iam_role" "ec2_role" {
  name = "ai_video_lab_ec2_role"

  assume_role_policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })

  tags = {
    Name = "ai-video-lab-ec2-role"
  }
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${aws_iam_role.ec2_role.name}-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy" "s3_policy" {
  name = "ai_video_lab_s3_policy"
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Action   = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
        ]
        Effect   = "Allow"
        Resource = [
          var.bucket_arn,
          "${var.bucket_arn}/*",
        ]
      },
    ]
  })
}
