provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "devops_sg" {
  name = "devops-security-group"

  ingress {
    description = "SSH access (intentional vulnerability)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Flask App"
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

  ami           = "ami-03f4878755434977f"   # Ubuntu AMI for ap-south-1
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  user_data = <<-EOF
#!/bin/bash
apt update -y
apt install -y python3 python3-pip

pip3 install flask

cat <<APP > /home/ubuntu/app.py
from flask import Flask
app = Flask(__name__)

@app.route("/")
def home():
    return "DevOps Assignment - App successfully deployed!"

app.run(host="0.0.0.0", port=5000)
APP

python3 /home/ubuntu/app.py &
EOF

  tags = {
    Name = "DevOpsAssignmentServer"
  }
}

output "instance_public_ip" {
  value = aws_instance.devops_server.public_ip
}