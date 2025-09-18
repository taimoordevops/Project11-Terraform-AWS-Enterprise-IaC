# ALB
output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

# ALB DNS (useful for testing)
output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value=aws_lb.alb.dns_name
}

# ALB Target Group
output "target_group_arn" {
  description = "ARN of the ALB Target Group"
  value= aws_lb_target_group.tg.arn   # <- make sure this matches the resource name
}

# NAT Gateway EIP
output "nat_eip_allocation_id" {
  description = "Allocation ID of the NAT Gateway Elastic IP"
  value       = aws_eip.nat.allocation_id
}

output "nat_eip_public_ip" {
  description = "Public IP of the NAT Gateway Elastic IP"
  value       = aws_eip.nat.public_ip
}
