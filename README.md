# AI Video Lab

This project is a proof-of-concept for an AI video generator deployed on AWS using Terraform. The goal is to create a simple, low-cost infrastructure that runs an AI video generator on a GPU-enabled EC2 instance in a private VPC, and automatically uploads the generated media to an S3 bucket.

---

## ✅ Current Progress

- [x] Terraform infrastructure complete: VPC, public/private subnets, route tables, internet gateway, NAT gateway
- [x] IAM roles and S3 bucket configured
- [x] EC2 instance successfully provisioned (t3.large for testing)
- [x] Mock image output tested and uploaded to S3
- [x] Shell script created to launch Stable Diffusion (Automatic1111) in Docker
- [ ] Awaiting GPU (g4dn.xlarge) on-demand quota approval from AWS

---

## Overview

The project consists of two main parts:

1. **Infrastructure Setup** – Provision AWS resources (VPC, EC2, S3, IAM) using Terraform.
2. **AI Image/Video Generation Application** – A Dockerized AI model (Stable Diffusion via Automatic1111) running on the EC2 instance and uploading its output to S3.

---

## Directory Structure

```bash
AWS-Project/
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── terraform.tfvars
    ├── outputs.tf
    └── modules/
        ├── vpc/
        ├── s3/
        ├── iam/
        └── compute/
run_sd_webui.sh     # Shell script to launch Stable Diffusion WebUI
```

---

## Getting Started

### Local Environment Setup

1. **Install and Configure AWS CLI:**
   - Run `aws configure` to set your credentials and region (e.g., `us-east-1`).

2. **Set Up Visual Studio Code:**
   - Install Terraform extension for syntax highlighting and linting.

3. **Initialize Git Repository:**
   - Run `git init` and push to GitHub for version control.

---

### Terraform Setup

1. **Navigate to the Terraform Directory:**
   ```bash
   cd terraform/
   ```

2. **Update Variables:**
   - Ensure `terraform.tfvars` includes values for `instance_type`, `ami`, and `bucket_name`.

3. **Provision Infrastructure:**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

---

## AI Application: Stable Diffusion (Automatic1111)

- **Containerized Launch:**
  - A shell script (`run_sd_webui.sh`) is ready to launch the container once GPU quota is approved.

- **S3 Output:**
  - Simulated and real outputs can be saved to `/outputs` and uploaded to your defined S3 bucket.

- **Security:**
  - EC2 runs in a private subnet with SSM access.
  - S3 VPC endpoint is used for secure, internal data transfers.

---

## Next Steps

- ✅ Validate real Stable Diffusion Docker container runs successfully after GPU upgrade
- ✅ Connect volume mount for persistent output
- 🔄 Automate S3 uploads after generation
- 🚀 Optional: open WebUI via port or tunneling for remote testing

---

## Future Enhancements

- **Auto-scaling EC2 or ECS**
- **Trigger via Lambda/API Gateway**
- **Monitoring with CloudWatch**
- **CI/CD pipeline for Terraform and image generation logic**

---

## Contributing

Fork, improve, and share feedback via pull requests. Community ideas and improvements welcome!

## License

MIT License