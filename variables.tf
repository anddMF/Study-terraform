variable "instance_name" {
    description = "Value of the name tag for the EC2 instance"
    type = string
    default = "VariableTest"
}

variable "access_key" {
    description = "Access key of AWS IAM user"
    type = string
}

variable "secret_key" {
    description = "Secret key of AWS IAM user"
    type = string
}

variable "sqs_name" {
    description = "Name of the SQS queue to be created."
    default = "my-first-sqs"
}

variable "ip_acesss_ssh" {
    description = "IP for the cidr_block in security group"
    type = string
}