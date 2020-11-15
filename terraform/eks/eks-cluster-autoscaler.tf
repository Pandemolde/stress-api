resource "aws_eks_node_group" "eks_autoscaling_group" {
  cluster_name    = aws_eks_cluster.ros_eks.name
  node_group_name = format("%s-autoscaling", var.eks_cluster_name)
  node_role_arn   = aws_iam_role.iam_role_eks_autoscaler.arn
  subnet_ids      = data.aws_subnet_ids.eks_subnets.ids

  scaling_config {
    desired_size  = var.eks_cluster_desired_size
    max_size      = var.eks_cluster_max_size
    min_size      = var.eks_cluster_min_size
  }
}

resource "aws_iam_role" "iam_role_eks_autoscaler" {
  name = "ros-eks-cluster-autoscaler"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "ros_eks_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.iam_role_eks_autoscaler.name
}

resource "aws_iam_role_policy_attachment" "ros_eks_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.iam_role_eks_autoscaler.name
}

resource "aws_iam_role_policy_attachment" "ros_eks_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.iam_role_eks_autoscaler.name
}