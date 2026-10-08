provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "${var.environment}-server"
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.50.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.50.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "allow_ssh" {
  name        = "${var.environment}_sg"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id # var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
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
