provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "devops_sg" {
  name = "devops-assignment-sg"

  ingress {
    description = "SSH open to world (intentional vulnerability)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "App port"
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

resource "aws_instance" "devops_server" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install docker -y
              service docker start

              docker run -d -p 5000:5000 python:3.11-slim bash -c "pip install flask && python - <<APP
              from flask import Flask
              app = Flask(__name__)
              @app.route('/')
              def home():
                  return 'DevOps Assignment - App successfully deployed!'
              app.run(host='0.0.0.0', port=5000)
APP"
              EOF

  tags = {
    Name = "DevOpsAssignmentServer"
  }
}