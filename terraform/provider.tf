terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket  = "rowden-tf-state"
    key     = "state/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
  required_version = ">= 1.8.3"
}


provider "aws" {
  region = var.region
}
