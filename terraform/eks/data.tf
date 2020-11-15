data aws_vpc "eks_vpc" {
  tags = { Name = "vpc-eks" }
}


data aws_subnet_ids "eks_subnets" {
  vpc_id = data.aws_vpc.eks_vpc.id
}