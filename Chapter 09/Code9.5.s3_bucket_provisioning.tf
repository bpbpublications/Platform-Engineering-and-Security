# main.tf
terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_s3_bucket" "data_bucket" {
  bucket = "my-org-data-${var.environment}"
  tags   = { Environment = var.environment }
}
# Define variables for the environment (dev/prod)
variable "environment" {
  description = "Deployment environment (dev/staging/prod)"
  type        = string
}

