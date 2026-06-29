# AWS Three-Tier Architecture using Terraform

## Project Overview

This project demonstrates the deployment of a production-style AWS three-tier architecture using Terraform.

The infrastructure includes networking, security, compute, load balancing, and database services following AWS best practices.

---

## Architecture

Internet
↓
Application Load Balancer
↓
EC2 Web Server
↓
Amazon RDS MySQL

---

## Services Used

- Amazon VPC
- Public & Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- IAM Role
- Amazon EC2
- Application Load Balancer
- Target Group
- Amazon RDS MySQL
- Terraform

---

## Project Structure

```
aws-3tier-terraform/
│
├── provider.tf
├── variables.tf
├── networking.tf
├── security.tf
├── compute.tf
├── loadbalancer.tf
├── database.tf
├── outputs.tf
├── terraform.tfvars.example
├── .gitignore
├── README.md
└── screenshots/
```

---

## Deployment

Initialize Terraform

```bash
terraform init
```

Validate

```bash
terraform validate
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

## Security Best Practices

- Private subnets for database
- Security Groups following least privilege
- IAM Role for EC2
- RDS not publicly accessible
- NAT Gateway for outbound internet access
- ALB exposed to the internet instead of EC2

---

## Skills Demonstrated

- AWS Networking
- Infrastructure as Code (Terraform)
- IAM
- Load Balancing
- Database Deployment
- Security Group Design
- Cloud Architecture

---

## Screenshots

Screenshots of the deployed infrastructure are available in the `screenshots` folder.
