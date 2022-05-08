variable "instance_name" {
    description = "Value of the name tag for the EC2 instance"
    type = string
    default = "VariableTest"
}

variable "access_key" {
    description = "Access key of AWS IAM user"
    type = string
}

variable "cidr_block_list" {
    type = list
    default = ["192...", "192..."]
}

variable "secret_key" {
    description = "Secret key of AWS IAM user"
    type = string
}

variable "sqs_name" {
    description = "Name of the SQS queue to be created."
    default = "my-first-sqs"
}

variable "ip_access_ssh" {
    description = "IP for the cidr_block in security group"
    type = string
}

variable "amis" {
    type = map

    default = {
        "us-east-1" = "ami-0e472ba40eb589f49"
        "us-east-2" = "ami-0ba62214afa52bec7"
    }
}

variable "key_name" {
    type = string
    default = "ec2-andrew"
}