# DevOps CI/CD Assignment

## Project Overview
This project demonstrates a complete DevOps pipeline that automates building, scanning, and deploying a containerized application using Jenkins, Docker, and Terraform. The application is deployed both locally using Docker and on a cloud environment using AWS.

The objective of this project is to implement a CI/CD pipeline with automated security scanning and infrastructure provisioning.

---

## Architecture

GitHub Repository  
↓  
Jenkins Pipeline  
↓  
Docker Image Build  
↓  
Trivy Security Scan  
↓  
Docker Container Deployment  
↓  
Application Running (Localhost / Cloud)

---

## Technologies Used

- Docker
- Jenkins
- Terraform
- AWS EC2
- Trivy (Security Scanner)
- GitHub
- Python (Flask)

---

## Project Structure
devops-assignment
│
├── app
│ ├── app.py
│ └── requirements.txt
│
├── terraform
│
├── screenshots
│
├── Dockerfile
├── Jenkinsfile
└── README.md


---

## Application

The application is a simple Flask web server that confirms successful deployment.

Example output:
DevOps Assignment - App successfully deployed!

---

## Docker Implementation

The application is containerized using Docker.

Build Docker image:
docker build -t devops-app .

Run container:
docker run -d -p 5000:5000 devops-app


Access application:
http://localhost:5000

---

## Jenkins CI/CD Pipeline

The Jenkins pipeline performs the following steps:

1. Fetch code from GitHub
2. Build Docker image
3. Perform security scanning using Trivy
4. Stop previous container if running
5. Deploy a new container

Pipeline stages:
Checkout Code
Build Docker Image
Security Scan
Stop Old Container
Run Docker Container


---

## Security Scanning

Security scanning is implemented using **Trivy**.

Command used in pipeline:
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy image devops-app

This identifies vulnerabilities in container images.

---

## Terraform Deployment
Terraform is used to provision AWS infrastructure.

Resources created:
- EC2 Instance
- Security Group
- Public IP

Deployment commands:
terraform init
terraform apply

Destroy infrastructure after demo:
terraform destroy

---

## Screenshots

The screenshots folder contains:

- Jenkins pipeline success
- Security vulnerability report
- Docker container deployment
- Application running
- AWS deployment

---

## GenAI Usage Report

Generative AI tools were used for:

- Understanding DevOps pipeline structure
- Writing Dockerfile
- Creating Jenkins pipeline
- Troubleshooting Docker and Jenkins issues
- Writing Terraform configuration
- Preparing documentation

AI assisted in debugging errors related to Docker permissions, Jenkins container configuration, and CI/CD pipeline execution.

---

## Conclusion

This project demonstrates a complete DevOps workflow that automates application deployment using CI/CD principles. It integrates containerization, security scanning, and infrastructure provisioning to create a modern DevOps pipeline.
