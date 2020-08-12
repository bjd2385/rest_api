provider "aws" {
  region = "us-east-1"
}


data "aws_security_group" "default" {
  tags = {
    Name = "default"
  }
}


resource "aws_instance" "ubuntu18" {
  # This is an AMI I've created, personally.
  ami = "ami-0342976d0c550662b"
  instance_type = "t2.medium"
  key_name = "brandon"
  user_data = file("user-data.sh")

  root_block_device {
    volume_size = 20
    encrypted = true
  }

  tags = {
    Name = "mongo-test"
    Owner = "Brandon"
  }
}