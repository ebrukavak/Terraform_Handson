provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

variable "num_of_buckets" {
  default = 2
}

variable "s3_bucket" {
  default     = "oliver-new-s3-bucket-addwhateveryouwant"
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "${var.s3_bucket}-${count.index}"
  count = var.num_of_buckets
}