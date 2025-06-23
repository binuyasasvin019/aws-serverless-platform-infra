resource "aws_iam_role" "lambda_role" {
  name = "${var.app_name}-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action    = "sts:AssumeRole",
        Effect    = "Allow",
        Principal = {
            Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_lambda_function" "app" {
  filename         = var.lambda_filename
  function_name    = var.app_name
  role             = aws_iam_role.lambda_role.arn
  handler          = "app.lambda_handler"
  runtime          = "nodejs18.x"
  source_code_hash = filebase64sha256(var.lambda_filename)
}

resource "aws_api_gateway_rest_api" "api" {
  name = "${var.app_name}-api"
}

resource "aws_api_gateway_resource" "resource" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "{proxy+}"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.api.id
  resource_id   = aws_api_gateway_resource.resource.id
  http_method   = "ANY"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id           = aws_api_gateway_rest_api.api.id
  resource_id           = aws_api_gateway_resource.resource.id
  http_method           = "ANY"
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                      = aws_lambda_function.app.invoke_arn
}

resource "aws_lambda_permission" "allow_apigateway" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.app.function_name
  principal     = "apigateway.amazonaws.com"
}

output "api_invoke_url" {
  value = "${aws_api_gateway_rest_api.api.execution_arn}/dev"
}
