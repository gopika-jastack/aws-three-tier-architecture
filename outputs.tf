#############################################
# VPC
#############################################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

#############################################
# Public Subnets
#############################################

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}

output "public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

#############################################
# Private Subnets
#############################################

output "private_subnet_1" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2" {
  value = aws_subnet.private_subnet_2.id
}

#############################################
# EC2
#############################################

output "ec2_instance_id" {
  value = aws_instance.web.id
}

output "ec2_public_ip" {
  value = aws_instance.web.public_ip
}

#############################################
# Load Balancer
#############################################

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.alb.dns_name
}

#############################################
# RDS
#############################################

output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.mysql.endpoint
}

output "rds_database_name" {
  value = aws_db_instance.mysql.db_name
}
