provider "aws" {
  region = "ap-southeast-2"   # Sydney region
  version = "~> 2.52"
}

# EC2 instance
resource "aws_instance" "example" {
  ami = "ami-02a599eb01e3b3c5b"  # Ubuntu 18.04 AMI in ap-southeast-2
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  # bash script to write text into index.html and run busybox
  # to fire up web server on port 8080 serving index.html
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p ${var.server_port} &
              EOF

  tags = {
      Name = "terraform-example"
  }
}

# Security group allowing incoming traffic on port 8080 from anywhere
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Input variables

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}

# Output variables

# Output the public IP address of the web server
output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP address of the web server"
}