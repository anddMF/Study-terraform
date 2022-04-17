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

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-0e472ba40eb589f49"
    instance_type = "t2.micro"
    key_name = "ec2-andrew"
    tags = {
        Name = "dev${count.index}"
    }

    vpc_security_group_ids = [aws_security_group.tf-acesso-ssh.id]
}

resource "aws_security_group" "tf-acesso-ssh" {
    name = "acesso"
    description = "acesso"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        # Please restrict your ingress to only necessary IPs and ports.
        # Opening to 0.0.0.0/0 can lead to security vulnerabilities
        cidr_blocks = [var.ip_acesss_ssh]
    }

    tags = {
        Name = "tf-ssh"
    }
}