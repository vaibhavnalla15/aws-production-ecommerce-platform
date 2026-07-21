############################################################
# RDS Outputs
############################################################

output "db_instance_endpoint" {
  description = "RDS endpoint"
  value       = aws_db_instance.tf_postgres_database.endpoint
}

output "db_instance_port" {
  description = "RDS port"
  value       = aws_db_instance.tf_postgres_database.port
}

output "db_instance_identifier" {
  description = "RDS instance identifier"
  value       = aws_db_instance.tf_postgres_database.identifier
}