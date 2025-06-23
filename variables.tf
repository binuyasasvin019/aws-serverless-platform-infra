// root/variables.tf
variable "app_name" {
  description = "Application Name (Prefix)"
  type        = string
}

variable "db_name" {
  description = "Database Name"
  type        = string
}

variable "db_user" {
  description = "Database User"
  type        = string
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}