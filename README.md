# DevOps CI/CD Pipeline Assignment

## Project Overview

This project demonstrates a complete **DevOps CI/CD pipeline** that automates building, scanning, and deploying a containerized application using modern DevOps tools.

The pipeline integrates **Docker, Jenkins, Terraform, AWS, and Trivy security scanning** to automate application deployment and infrastructure provisioning.

The project includes:

- Containerization using Docker
- Continuous Integration and Deployment using Jenkins
- Security scanning using Trivy
- Infrastructure provisioning using Terraform
- Cloud deployment on AWS EC2

---

# Architecture

The overall system architecture is shown below:

GitHub Repository  
↓  
Jenkins CI/CD Pipeline  
↓  
Docker Image Build  
↓  
Trivy Security Scan  
↓  
Docker Container Deployment  
↓  
Terraform Infrastructure Provisioning  
↓  
AWS EC2 Instance  
↓  
Application Accessible via Public IP

---

# Technologies Used

| Tool         | Purpose                         |
| ------------ | ------------------------------- |
| Docker       | Containerization of application |
| Jenkins      | CI/CD pipeline automation       |
| Terraform    | Infrastructure as Code          |
| AWS EC2      | Cloud compute instance          |
| Trivy        | Security vulnerability scanning |
| GitHub       | Source code management          |
| Python Flask | Web application                 |

---

# Project Structure

**devops-assignment  
│  
├── app
│ ├── app.py  
│ ├── requirements.txt  
│ └── templates
│ └── index.html  
│  
├── terraform  
│ └── main.tf  
│  
├── screenshots
│  
├── Dockerfile  
├── Jenkinsfile
└── README.md **

---

# Application

The application is a simple **Python Flask web server** that confirms successful deployment.

Example output:

DevOps Assignment - App successfully deployed!

The improved UI version displays a styled webpage confirming successful deployment using the DevOps pipeline.

---

# Docker Implementation

The application is containerized using Docker.

Build Docker image:

docker build -t devops-app .

Run container:
docker run -d -p 5000:5000 devops-app

Access application:
http://localhost:5000

---

# Jenkins CI/CD Pipeline

Jenkins automates the CI/CD process.

Pipeline stages:

1. Checkout Code
2. Build Docker Image
3. Security Scan using Trivy
4. Stop Old Container
5. Deploy New Container

The pipeline pulls source code from GitHub, builds the Docker image, performs security scanning, and deploys the container automatically.

---

# Security Scanning

Security scanning is implemented using **Trivy**.

Command used in Jenkins pipeline:
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image devops-app

This scans the container image for vulnerabilities and misconfigurations.

---

# Infrastructure as Code (Terraform)

Terraform is used to provision infrastructure on **AWS Cloud**.

Resources created:

- AWS EC2 instance
- Security Group
- Public IP

Terraform commands used:

Initialize Terraform:
terraform init

Preview infrastructure changes:
terraform plan

Deploy infrastructure:
terraform apply

Destroy infrastructure after demonstration:
terraform destroy

---

# Intentional Security Vulnerability

As required by the assignment, the Terraform configuration initially included an **intentional security vulnerability**.

Example vulnerability:

SSH Port 22 open to 0.0.0.0/0

This allows SSH access from any IP address and is considered an insecure configuration.

The vulnerability was identified during security scanning and discussed in the AI remediation process.

---

# Before & After Security Report

### Before Fix

- SSH port open to public internet (0.0.0.0/0)
- Potential unauthorized access risk

### After Fix

- Security issue identified using Trivy
- Configuration reviewed and documented
- Improved infrastructure configuration practices applied

---

# Cloud Deployment

The application was deployed on **AWS EC2** using Terraform.

Steps performed:

1. Terraform created EC2 instance automatically
2. Security group configured with required ports
3. Application installed and launched using user-data script
4. Application accessed using public IP address

Example access:
http://<65.0.109.29>:5000

---

# Screenshots

The `screenshots` folder includes:

- Jenkins pipeline success
- Docker image build
- Docker container running
- Trivy security scan report
- Report Summary
- Application running locally
- Application running on AWS cloud

---

# Video Demonstration

A video demonstration of the complete project execution is available here:

https://drive.google.com/file/d/1RNrvJOEhYgBe7Bj2p3EryoPzfyxHm4G-/view?usp=drivesdk

The video demonstrates:

- GitHub repository
- Jenkins pipeline execution
- Security scanning results
- Terraform infrastructure deployment
- Application running on AWS public IP

---

# GenAI Usage Report

Generative AI tools were used during this project for guidance and troubleshooting.

### Example AI Prompt Used

Help me build a DevOps CI/CD pipeline using Docker, Jenkins, Terraform, AWS and Trivy security scanning.

### AI Assistance Provided

- Understanding CI/CD pipeline architecture
- Writing Dockerfile and Flask application structure
- Creating Jenkins pipeline script
- Debugging Docker and Jenkins container issues
- Writing Terraform configuration
- Troubleshooting AWS deployment issues
- Preparing project documentation

### Security Improvement Suggestions

AI recommendations helped identify risks such as:

- Open SSH access to public internet
- Insecure infrastructure configuration

These insights helped improve the overall security awareness of the deployment.

---

# Conclusion

This project demonstrates a complete DevOps workflow that automates application deployment using CI/CD principles.

Key achievements:

- Containerized application using Docker
- Automated CI/CD pipeline using Jenkins
- Security vulnerability scanning using Trivy
- Infrastructure provisioning using Terraform
- Cloud deployment on AWS EC2

This project highlights the integration of modern DevOps tools to create an automated, scalable
