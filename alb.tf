##########################################################
# Application Load Balancer + Target Group + Listener
##########################################################

# ALB Security Group (already declared in sg.tf)
# aws_security_group.alb_sg

# ALB
resource "aws_lb" "alb" {
  name               = "project11-alb"
  load_balancer_type = "application"
  subnets            = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  security_groups    = [aws_security_group.alb_sg.id]

  tags = {
    Name = "project11-alb"
  }
}

# ALB Target Group
resource "aws_lb_target_group" "tg" {
  name     = "project11-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  tags = {
    Name = "project11-tg"
  }
}

# ALB Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
