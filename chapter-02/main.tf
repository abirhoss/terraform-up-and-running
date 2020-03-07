provider "aws" {
    region = "ap-southeast-2"   # Sydney region
    version = "~> 2.52"
}

# EC2 instance
resource "aws_instance" "example" {
    ami = "ami-02a599eb01e3b3c5b"  # Ubuntu 18.04 AMI in ap-southeast-2
    instance_type = "t2.micro"

    tags = {
        Name = "terraform-example"
    }
}
