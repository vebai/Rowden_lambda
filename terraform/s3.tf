data "archive_file" "lambda_package" {
  type        = "zip"
  source_dir  = "../lambda"
  output_path = "../lambda_package.zip"
}


resource "aws_s3_bucket" "this" {
  bucket = var.rowden_bucket
  acl    = "private"
  tags   = var.tags
}


resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_object" "lambda_package" {
  bucket = aws_s3_bucket.this.bucket
  key    = "lambda_package.zip"
  source = data.archive_file.lambda_package.output_path
}
