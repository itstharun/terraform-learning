terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_s3_bucket" "k" {
  bucket = "tharun-test-bucket1"
  acl    = "private"

  tags = {
    Name        = "Tharuntestbucket"
    Environment = "Dev"
  }
}
