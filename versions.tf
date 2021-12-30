terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
    }
  }
  backend "s3" {
    bucket         = "tf-backend-softserve"
    key            = "tf-ecs-source/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-state-lock-dynamo"

  }
}