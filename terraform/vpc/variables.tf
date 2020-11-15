variable "region" {
  description = "AWS current working region"
  default     = "eu-west-1"
}

variable "s3_bucket" {
  description = "S3 Bucket to store TF states"
  default     = "xavi-tfstates"
}