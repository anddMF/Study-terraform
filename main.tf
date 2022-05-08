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
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "ec2-andrew"
    tags = {
        Name = "dev${count.index}"
    }

    vpc_security_group_ids = ["${aws_security_group.tf-acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
    provider = aws.east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = "ec2-andrew" # key pair needs to be in the region of the instance
    tags = {
        Name = "dev4"
    }
    vpc_security_group_ids = ["${aws_security_group.tf-acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev3-bucket, aws_dynamodb_table.dev-ddb-table]
}

resource "aws_dynamodb_table" "dev-ddb-table" {
    provider = aws.east-2
    name = "GameScore"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "UserId"
    range_key = "GameTitle"

    attribute {
        name = "UserId"
        type = "S"
    }

    attribute {
        name = "GameTitle"
        type = "S"
    }
}

resource "aws_s3_bucket" "dev3-bucket" {
  bucket = "terraform-dev3"
  acl = "private"
  tags = {
    Name = "terraform-dev3"
  }
}