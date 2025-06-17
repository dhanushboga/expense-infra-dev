terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.94.1"
    }
  }

  backend "s3" {
    bucket         = "82s-chenchu-state"
    key            = "expense-vpc" #unique keys within the bucket and same key cannot be use
    region         = "us-east-1"
    dynamodb_table = "82s-chenchu-1"
  }
}

provider "aws" {
  region = "us-east-1"
}