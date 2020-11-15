resource "aws_ecr_repository" "stress_api_repository" {
  name = var.ecr_name
}