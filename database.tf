#############################################
# DB Subnet Group
#############################################

resource "aws_db_subnet_group" "db_subnet_group" {

  name = "demo-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet_1.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "demo-db-subnet-group"
  }
}

#############################################
# RDS MySQL Instance
#############################################

resource "aws_db_instance" "mysql" {

  identifier = "demo-mysql"

  engine         = "mysql"
  engine_version = "8.0"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  db_name  = "appdb"

  username = var.db_username
  password = var.db_password

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  publicly_accessible = false
  multi_az = false
  storage_encrypted = true
  skip_final_snapshot = true
  deletion_protection = false
  backup_retention_period = 7

  tags = {
    Name = "demo-mysql"
  }
}
