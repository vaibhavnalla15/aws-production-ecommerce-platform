############################################################
# RDS Subnet Group
############################################################

resource "aws_db_subnet_group" "tf_db_subnet_group" {
  name = local.resource_names.db_subnet_group

  subnet_ids = var.private_subnet_ids

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.db_subnet_group
    }
  )
}

############################################################
# PostgreSQL Database
############################################################

resource "aws_db_instance" "tf_postgres_database" {
  identifier = local.resource_names.db_instance

  engine         = "postgres"
  engine_version = "17.5"

  instance_class = "db.t4g.micro"

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_type          = "gp3"
  storage_encrypted     = true

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.tf_db_subnet_group.name
  vpc_security_group_ids = [var.rds_security_group_id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:04:00-sun:05:00"

  skip_final_snapshot = true
  deletion_protection = false

  apply_immediately = true

  tags = merge(
    var.common_tags,
    {
      Name = local.resource_names.db_instance
    }
  )
}