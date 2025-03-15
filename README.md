# AI Video Lab

This project is a proof-of-concept for an AI video generator deployed on AWS using Terraform. The goal is to create a simple, low-cost infrastructure that runs an AI video generator on a GPU-enabled EC2 instance in a private VPC, and automatically uploads the generated video to an S3 bucket.

## Overview

The project consists of two main parts:

1. **Infrastructure Setup** – Provision AWS resources (VPC, EC2, S3, etc.) using Terraform.
2. **AI Video Generation Application** – A Dockerized AI video generator that runs on the EC2 instance and uploads its output to S3.

This README provides an overview of the project structure and steps to get started.

## Directory Structure

Below is the Terraform directory structure used to provision the AWS infrastructure:

AWS Project/
└── terraform/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── modules/
        ├── vpc/
        ├── s3/
        └── iam/


## Getting Started

### Local Environment Setup

1. **Install and Configure AWS CLI:**
   - Install the AWS CLI (version 2) on your Mac.
   - Run `aws configure` and enter your AWS Access Key, Secret Access Key, default region (`us-east-1`), and output format (e.g., `json`).

2. **Set Up Visual Studio Code:**
   - Ensure Visual Studio Code is installed.
   - Install the Terraform extension for syntax highlighting and linting.

3. **Initialize Git Repository:**
   - Create a new Git repository in your project folder and push the initial commit to GitHub.

### Terraform Setup

1. **Navigate to the Terraform Directory:**
   - Open the `terraform/` folder in Visual Studio Code.

2. **Update Variables:**
   - Edit `variables.tf` with your project-specific values (e.g., instance type, VPC CIDR block).

3. **Initialize and Deploy Infrastructure:**
   - Run `terraform init` to initialize the Terraform project.
   - Run `terraform plan` to review the planned changes.
   - Run `terraform apply` to provision the AWS resources.

### AI Video Generation Application

- **Application Overview:**
  - The AI video generator is packaged as a Docker container and runs on a GPU-enabled EC2 instance.
  - Once the video is generated, it is uploaded to an S3 bucket using a user data script.
  
- **Security:**
  - The EC2 instance is deployed in a private subnet within a VPC.
  - An S3 VPC endpoint ensures that traffic between the EC2 instance and S3 does not traverse the public internet.
  
## Future Enhancements

- **Scalability:**  
  Expand the setup by adding an ECS cluster with Auto Scaling for handling increased workloads.

- **Content Distribution:**  
  Integrate CloudFront to globally distribute your videos.

- **CI/CD Integration:**  
  Set up automated testing and deployment pipelines using GitHub Actions or AWS CodePipeline.

- **Enhanced Monitoring:**  
  Implement CloudWatch for in-depth monitoring and alerting.

## Contributing

Feel free to fork this repository, make improvements, and submit pull requests. Your feedback and suggestions are welcome!

## License

This project is licensed under the MIT License.

