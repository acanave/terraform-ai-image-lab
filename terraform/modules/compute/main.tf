resource "aws_instance" "text_to_image_instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = var.security_group_ids
  iam_instance_profile   = var.iam_instance_profile
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install docker -y
    service docker start
    usermod -a -G docker ec2-user

    cd /home/ec2-user
    git clone https://github.com/AbdBarho/stable-diffusion-webui-docker.git
    cd stable-diffusion-webui-docker
    docker build -t stable-diffusion-webui:latest .
    docker run -d --rm -p 7860:7860 stable-diffusion-webui:latest
  EOF

  tags = {
    Name = "ai-video-lab-text-to-image-instance"
  }
}
