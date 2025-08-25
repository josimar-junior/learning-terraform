import {
  to = aws_iam_role.lambda_execution_role
  id = "manually-created-lambda-role-2e1osqjc"
}

import {
  to = aws_iam_policy.lambda_execution_policy
  id = "arn:aws:iam::864899834937:policy/service-role/AWSLambdaBasicExecutionRole-2b9fb618-1282-4d8e-88a0-68e73a57ac39"
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
  name = "manually-created-lambda-role-2e1osqjc"
  path = "/service-role/"
}

resource "aws_iam_policy" "lambda_execution_policy" {
  name = "AWSLambdaBasicExecutionRole-2b9fb618-1282-4d8e-88a0-68e73a57ac39"
  path = "/service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = "logs:CreateLogGroup"
      Effect   = "Allow"
      Resource = "arn:aws:logs:us-east-1:864899834937:*"
      }, {
      Action   = ["logs:CreateLogStream", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = ["arn:aws:logs:us-east-1:864899834937:log-group:/aws/lambda/manually-created-lambda:*"]
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "lambda_execution" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_execution_policy.arn
}