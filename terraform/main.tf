resource "aws_lambda_function" "ec2_stop" {
  filename         = data.archive_file.lambda_package.output_path
  function_name    = "ec2_stop_function"
  role             = aws_iam_role.lambda_execution.arn
  handler          = "ec2_stop.lambda_handler"
  runtime          = "python3.8"
  source_code_hash = filebase64sha256(data.archive_file.lambda_package.output_path)

  vpc_config {
    subnet_ids         = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  environment {
    variables = {
      aws_region = var.aws_region
      string_tag = var.string_tag
    }
  }

  tags = var.tags
}

