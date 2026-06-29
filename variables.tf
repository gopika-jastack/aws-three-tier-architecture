variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1" {
  default = "10.0.1.0/24"
}

variable "public_subnet_2" {
  default = "10.0.2.0/24"
}

variable "private_subnet_1" {
  default = "10.0.3.0/24"
}

variable "private_subnet_2" {
  default = "10.0.4.0/24"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "db_username" {
  description = "Database Username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Database Password"
  type        = string
  sensitive   = true
}
