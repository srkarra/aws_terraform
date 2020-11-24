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

# Create a EC2 instance
resource "aws_instance" "my-first-server"{
    ami = "ami-03657b56516ab7912"
    instance_type = "t2.micro"
    tags = {
        Name = "first-instance"
    }  
}

# Create S3 bucket 
resource "aws_s3_bucket" "example-tf-bucket-23" {
  bucket = "my-tf-rks23-bucketname-unique"
  acl = "private"
  tags = {
    Name = "my-ttfest-s3-terraform-bucket"
  }
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "test environment"
  }
}
resource "aws_subnet" "vpc-subnet-1" {
  vpc_id     = aws_vpc.test-vpc.id # Getting the vpc id from the VPC created above
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "test environment subnet"
  }
}
