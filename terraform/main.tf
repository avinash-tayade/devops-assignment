provider "aws" {
  region = "ap-south-1"
}

# Security Group
resource "aws_security_group" "devops_sg" {
  name        = "devops-security-group"
  description = "Allow SSH and Flask app"

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Intentional vulnerability
  }

  ingress {
    description = "Flask app access"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "devops_server" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3

              pip3 install flask

              cat <<APP > /home/ec2-user/app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "DevOps Assignment - App successfully deployed!"

app.run(host='0.0.0.0', port=5000)
APP

              python3 /home/ec2-user/app.py &
              EOF

  tags = {
    Name = "DevOpsAssignmentServer"
  }
}

output "instance_public_ip" {
  value = aws_instance.devops_server.public_ip
}