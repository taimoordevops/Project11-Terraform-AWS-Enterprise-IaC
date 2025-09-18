resource "aws_lb_target_group" "app_tg" {
  name     = "project11-tg-${terraform.workspace}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  target_type = "instance"
  health_check {
    path                = "/"
    protocol            = "HTTP"
    interval            = 30
    unhealthy_threshold = 2
    healthy_threshold   = 3
    timeout             = 5
  }
}
