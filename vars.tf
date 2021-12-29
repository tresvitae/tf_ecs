variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "ECS_AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-015b1508a2ff2c65a"
    eu-west-2 = "ami-0141564f07476504d"
  }
}

variable"PUBLIC_KEY" {
  type    = string
}

variable "project_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}