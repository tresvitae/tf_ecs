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

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-08ca3fed11864d6bb" # Ubuntu Server 20.04 LTS (HVM)
    eu-west-2 = "ami-0015a39e4b7c0966f" # Ubuntu Server 20.04 LTS (HVM)
  }
}
variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
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

# myapp.tf
variable "MYAPP_SERVICE_ENABLE" {
  default = "1"
}

variable "MYAPP_VERSION" {
  default = "0"
}

