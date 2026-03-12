provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "vulnerable_sg" {
  name        = "devops-vulnerable-sg"
  description = "Allow SSH from anywhere (intentional vulnerability)"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]   # Intentional vulnerability
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}