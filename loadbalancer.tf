#############################################
# Application Load Balancer
#############################################

resource "aws_lb" "alb" {
  name               = "demo-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]

  enable_deletion_protection = false

  tags = {
    Name = "demo-alb"
  }
}

#############################################
# Target Group
#############################################

resource "aws_lb_target_group" "web_tg" {

  name     = "web-target-group"
  port     = 80
  protocol = "HTTP"

  vpc_id = aws_vpc.main.id

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "web-target-group"
  }
}

#############################################
# Register EC2 Instance
#############################################

resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web_tg.arn
  target_id = aws_instance.web.id
  port = 80
}

#############################################
# HTTP Listener
#############################################

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}
