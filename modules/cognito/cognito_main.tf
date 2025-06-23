resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.app_name}-userpool"
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = "${var.app_name}-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}
output "user_pool_client_id" {
  value = aws_cognito_user_pool_client.user_pool_client.id
}
