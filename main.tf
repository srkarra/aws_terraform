# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 2.70"
#     }
#   }
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_instance" "my-first-server"{
    ami = "ami-03657b56516ab7912"
    instance_type = "t2.micro"
    tags = {
        Name = "first-instance"
    }
}

