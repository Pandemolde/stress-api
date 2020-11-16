provider "aws" {
  region = "eu-west-1"
  shared_credentials_file = pathexpand("~/.aws/credentials")
}

terraform {
  required_version = ">0.13"
  backend "s3" {
    bucket = "xavi-tfstates"
    region = "eu-west-1"
    key    = "ecr/ros-ecr.tfstate"
  }
}