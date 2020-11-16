resource "aws_vpc" "vpc-eks" {
  cidr_block  = "10.0.0.0/16"
  tags        = { Name = "vpc-eks" }
}

resource "aws_subnet" "eks-subnet-1" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.vpc-eks.id
  availability_zone = format("%sa", var.region)
}