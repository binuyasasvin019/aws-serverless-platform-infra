module "s3_cloudfront" {
  source   = "./modules/s3_cloudfront"
  app_name = var.app_name
}

module "cognito" {
  source   = "./modules/cognito"
  app_name = var.app_name
}

module "dynamodb" {
  source     = "./modules/dynamodb"
  table_name = "${var.app_name}-sessions"
}

module "aurora" {
  source      = "./modules/aurora"
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
}

module "lambda_apigw" {
  source           = "./modules/lambda_apigw"
  app_name         = var.app_name
  lambda_filename  = "${path.root}/app.zip"
}