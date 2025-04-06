resource "aws_instance" "text_to_image_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              # Install Git
              yum install git -y

              # Clone the Automatic1111 WebUI repo
              git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git /home/ec2-user/stable-diffusion-webui

              # Change directory & run the webui (optional, as it can be very GPU-intensive)
              cd /home/ec2-user/stable-diffusion-webui
              ./webui.sh --listen
              EOF
              
  tags = {
    Name = "ai-video-lab-text-to-image-instance"
  }
}