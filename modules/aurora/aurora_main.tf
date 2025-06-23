resource "aws_rds_cluster" "aurora" {
  engine            = "aurora-mysql"
  engine_version    = "8.0.mysql_aurora.3.02.0"
  database_name     = var.db_name
  master_username   = var.db_user
  master_password   = var.db_password
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  count              = 1
  identifier         = "${var.db_name}-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora.id
  engine             = "aurora-mysql"
  instance_class     = "db.t3.medium"
}

output "aurora_endpoint" {
  value = aws_rds_cluster.aurora.endpoint
}
