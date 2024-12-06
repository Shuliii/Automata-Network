# provider "aws" {
#   region     = "ap-southeast-1"
# }

# #s3 backend
# terraform {
#   backend "s3" {
#     bucket     = "rico-automata-s3"
#     key        = "terraform/statefile.tfstate"
#     region     = "ap-southeast-1"
#   }

#   # backend "local" {
#   #   path="terraform.tfstate"
#   # }
# }

# #VPC
# resource "aws_vpc" "automata" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "automata-vpc"
#   }
# }

# # #IGW
# resource "aws_internet_gateway" "automata-igw" {
#   vpc_id = aws_vpc.automata.id
#   tags = {
#     Name = "igw"
#   }
# }

# #Route Table
# resource "aws_route_table" "public_route_table" {
#   vpc_id = aws_vpc.automata.id
#   tags = {
#     Name = "public-route-table"
#   }
# }

# #Route
# resource "aws_route" "public_internet" {
#   route_table_id         = aws_route_table.public_route_table.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.automata-igw.id
# }

# #Public Subnet
# resource "aws_subnet" "public_subnet" {
#   for_each          = { for subnet in var.public_subnets : subnet.az => subnet }
#   vpc_id            = aws_vpc.automata.id
#   cidr_block        = each.value.cidr_block
#   availability_zone = each.value.az
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "public-subnet-${each.value.az}"
#   }
# }

# #Route Table Associations
# resource "aws_route_table_association" "public" {
#   for_each = aws_subnet.public_subnet
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public_route_table.id
# }

