provider "aws" {
  region     = "ap-southeast-1"
}

#s3 backend
terraform {
  backend "s3" {
    bucket         = "rico-automata-tfstate"
    key            = "terraform/statefile.tfstate"
    region         = "ap-southeast-1"
  }
}

#VPC
resource "aws_vpc" "automata" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "automata-vpc"
  }
}

# #IGW
resource "aws_internet_gateway" "automata-igw" {
  vpc_id = aws_vpc.automata.id
  tags = {
    Name = "bgw"
  }
}