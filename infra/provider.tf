provider "aws" {
  region     = "ap-southeast-1"
}

#adding the s3 backend
# terraform {
#   backend "s3" {
#     bucket         = "barkeley-tfstate1"
#     key            = "terraform/statefile.tfstate"
#     region         = "ap-southeast-1"
#   }
# }

#VPC
resource "aws_vpc" "automata" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "automata-vpc"
  }
}