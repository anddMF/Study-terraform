terraform {
    required_providers {
        aws = {
            source     = "hashicorp/aws"
            version    = "~> 2.0"
        }
    }
    
  required_version = ">= 0.14.9"
}

provider "aws" {
    region  = "us-east-1"
}

provider "aws" {
    alias = "east-2"
    region = "us-east-2"
}

resource "aws_instance" "dev" {
    count = 2
    ami = "ami-0e472ba40eb589f49"
    instance_type = "t2.micro"
    key_name = "ec2-andrew"
    tags = {
        Name = "dev${count.index}"
    }

    vpc_security_group_ids = ["${aws_security_group.tf-acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
    ami = "ami-0e472ba40eb589f49"
    instance_type = "t2.micro"
    key_name = "ec2-andrew"
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.tf-acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev3-bucket]
}

resource "aws_s3_bucket" "dev3-bucket" {
  bucket = "terraform-dev3"
  acl = "private"
  tags = {
    Name = "terraform-dev3"
  }
}