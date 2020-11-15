variable "eks_cluster_name" {
  description = "EKS cluster name"
  default     = "ros-eks"
}

variable "eks_cluster_desired_size" {
  description = "EKS cluster node desired size"
  default     = 1
}

variable "eks_cluster_max_size" {
  description = "EKS cluster node max size"
  default     = 5
}

variable "eks_cluster_min_size" {
  description = "EKS cluster node min size"
  default     = 1
}