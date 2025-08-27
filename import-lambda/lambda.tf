import {
  to = aws_lambda_function.this
  id = "manually-created-lambda"
}

data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "${path.root}/build/index.mjs"
  output_path = "${path.root}/lambda.zip"
}

resource "aws_lambda_function" "this" {
  architectures                  = ["arm64"]
  description                    = "Changed lambda from Terraform"
  filename                       = "lambda.zip"
  function_name                  = "manually-created-lambda"
  handler                        = "index.handler"
  memory_size                    = 128
  package_type                   = "Zip"
  reserved_concurrent_executions = -1
  role                           = aws_iam_role.lambda_execution_role.arn
  runtime                        = "nodejs22.x"
  skip_destroy                   = false
  source_code_hash               = data.archive_file.lambda_code.output_base64sha256
  timeout                        = 3
  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.lambda.name
  }
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}