variable "string_tag" {
  default     = "Rowden"
  description = "Tag on instance to search"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-2"
}


variable "tags" {
  default = {
    Name        = "Rowden"
    Environment = "production"
  }
}

variable "state_bucket" {
  default     = "rowden-tf-state"
  description = "Name of the S3 Bucket"
  type        = string
}

variable "rowden_bucket" {
  default     = "rowden-lambda-storage-bucket"
  description = "Name of the S3 Bucket"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_a" {
  description = "CIDR block for the public subnet in AZ A"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_b" {
  description = "CIDR block for the public subnet in AZ B"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone_a" {
  description = "Availability Zone A"
  type        = string
  default     = "eu-west-2a"
}

variable "availability_zone_b" {
  description = "Availability Zone B"
  type        = string
  default     = "eu-west-2b"
}

variable "lambda_sg_name" {
  description = "Name for the Lambda security group"
  type        = string
  default     = "lambda_sg"
}

