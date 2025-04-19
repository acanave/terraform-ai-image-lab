resource "aws_instance" "text_to_image_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = var.security_group_ids
  iam_instance_profile        = var.iam_instance_profile
  associate_public_ip_address = false

  user_data = <<-EOF
    #!/bin/bash
    set -e

    ### 1) Install system dependencies
    apt-get update -y
    apt-get install -y \
      wget \
      git \
      python3 \
      python3-venv \
      python3-pip \
      libgl1 \
      libglib2.0-0

    ### 2) Fix ownership so ${var.default_user} can write to their home
    chown -R ${var.default_user}:${var.default_user} /home/${var.default_user}

    ### 3) Prep work directories and a venv as the non-root user
    runuser -l ${var.default_user} -c '
      mkdir -p ~/stable-diffusion-webui
      mkdir -p ~/stable-diffusion/outputs
      cd ~/stable-diffusion-webui
      python3 -m venv venv
    '

    ### 4) DONE – now you can SSM in as ${var.default_user}, cd into ~/stable-diffusion-webui,
    ###    source venv/bin/activate, git clone or git pull, pip install -r requirements.txt,
    ###    and then ./webui.sh --listen (with port-forwarding via SSM).
  EOF

  tags = {
    Name          = "ai-video-lab-text-to-image-instance"
    ForceRecreate = "2025-04-10"
  }

  user_data_replace_on_change = true

  lifecycle {
    create_before_destroy = true
  }
}
