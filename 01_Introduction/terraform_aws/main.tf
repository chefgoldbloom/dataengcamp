terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "data-bucket" {
    tags = {
      Name = "DataCamp Bucket"
    }
}

resource "aws_s3_bucket_lifecycle_configuration" "bucket-config" {
    bucket = aws_s3_bucket.data-bucket.id

    rule {
      id = "expiry"

      expiration {
        days = 20
      }

      status = "Enabled"
    }
}
