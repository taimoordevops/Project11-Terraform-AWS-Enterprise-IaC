##########################################################
# EC2 Instance
##########################################################
resource "aws_instance" "app_server" {
  ami           = "ami-0becc523130ac9d5d" 
  instance_type = "t3.micro"              # ✅ Free Tier eligible
  subnet_id     = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name      = "project11-key"         # 🔑 use the key pair created earlier

  tags = {
    Name = "project11-app-server"
  }
}
