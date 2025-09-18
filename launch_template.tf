resource "aws_launch_template" "app" {
  name_prefix   = "project11-app-"
  image_id      = "ami-0becc523130ac9d5d"
  instance_type = var.instance_type
  key_name = "project11-key"

  network_interfaces {
    security_groups = [aws_security_group.ec2_sg.id]
    associate_public_ip_address = true
  }

user_data = filebase64("${path.module}/user_data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Project11AppInstance"
      Environment = terraform.workspace
    }
  }
}