resource "aws_security_group" "tf-acesso-ssh" {
    name = "tf-acesso-ssh"
    description = "tf-acesso-ssh"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        # Please restrict your ingress to only necessary IPs and ports.
        # Opening to 0.0.0.0/0 can lead to security vulnerabilities
        cidr_blocks = ["${var.ip_access_ssh}"]
    }

    tags = {
        Name = "tf-ssh"
    }
}

resource "aws_security_group" "tf-acesso-ssh-east-2" {
    provider = aws.east-2
    name = "tf-acesso-ssh-east-2"
    description = "tf-acesso-ssh-east-2"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        # Please restrict your ingress to only necessary IPs and ports.
        # Opening to 0.0.0.0/0 can lead to security vulnerabilities
        cidr_blocks = ["${var.ip_access_ssh}"]
    }

    tags = {
        Name = "tf-ssh-east-2"
    }
}