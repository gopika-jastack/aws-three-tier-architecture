#############################
# IAM Instance Profile
#############################

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-demo-profile"
  role = "EC2DemoRole"
}

#############################
# Latest Amazon Linux 2023 AMI
#############################

data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

#############################
# EC2 Instance
#############################

resource "aws_instance" "web" {

  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_1.id

  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  user_data = <<EOF
#!/bin/bash

dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<HTML > /var/www/html/index.html
<html>
<head>
<title>Cloud Engineer Portfolio</title>
</head>
<body style="font-family:Arial;text-align:center;margin-top:80px;">
<h1>AWS Three Tier Architecture</h1>
<h2>Provisioned using Terraform</h2>
<p>Created by Gopika Shri</p>
</body>
</html>
HTML

EOF

  tags = {
    Name = "web-server-1"
  }
}
