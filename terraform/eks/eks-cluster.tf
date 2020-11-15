resource "aws_eks_cluster" "ros_eks" {
  name      = var.eks_cluster_name
  role_arn  = aws_iam_role.eks_iam_role.arn
  vpc_config {
    subnet_ids = data.aws_subnet_ids.eks_subnets.ids
  }
}

data "aws_iam_policy_document" "eks_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity"]
    effect = "Allow"
  }
}
resource "aws_iam_role" "eks_iam_role" {
  assume_role_policy = data.aws_iam_policy_document.eks_assume_role_policy.json
  name               = "eks-iam-role"
}