resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 1
  min_size             = 1
  max_size             = 2
  vpc_zone_identifier = [aws_subnet.public_1.id]
  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg.arn]

  tag {
    key                 = "Name"
    value               = "Project11ASGInstance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}
