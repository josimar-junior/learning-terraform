import {
  to = aws_iam_role.lambda_execution_role
  id = "manually-created-lambda-role-2e1osqjc"
}

resource "aws_iam_role" "lambda_execution_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  name                  = "manually-created-lambda-role-2e1osqjc"
  path                  = "/service-role/"
}