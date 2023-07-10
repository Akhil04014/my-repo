terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.7.0"
    }
  }
}

provider "aws" {
  region      = "us-east-2"
  access_key  = "AKIA3HFO3HUQVC3CEE7D"
  secret_key  = "QmV1InFhXx5GaSi9I18OR3qCc4WBvyLvhimeROr7"
}

resource "aws_instance" "example" {
  ami           = "ami-05803413c51f242b7"  # Ubuntu 20.04 LTS (HVM)
  instance_type = "t2.micro"
  key_name      = "terraformfile"
  subnet_id     = "subnet-0101ed1ad09d96939"  # Replace with your subnet ID

  tags = {
    Name = "MyUbuntuInstance"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update
    apt install -y apache2
    systemctl start apache2
    systemctl enable apache2
  EOF
}
