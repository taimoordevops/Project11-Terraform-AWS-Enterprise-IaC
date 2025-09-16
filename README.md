# Project 11 - Terraform AWS Enterprise IaC

This project demonstrates **enterprise-level AWS Infrastructure as Code (IaC)** using Terraform.  
It builds upon Project 10 and introduces production-grade practices:  
- VPC with public/private subnets across AZs  
- ALB + Auto Scaling Group for EC2s  
- IAM roles and policies  
- CloudWatch dashboards, alarms, logs  
- S3 buckets for logs and remote state  
- DynamoDB table for state locking  
- Multi-environment setup (dev/stage/prod via workspaces)  

📂 **Repo Structure**
```
Project11-terraform-aws-enterprise-iac/
├─ provider.tf
├─ versions.tf
├─ variables.tf
├─ network.tf
├─ ec2.tf
├─ alb.tf
├─ cloudwatch.tf
├─ iam.tf
├─ s3.tf
├─ backend.tf
├─ outputs.tf
├─ terraform.tfvars
├─ .gitignore
├─ screenshots/
└─ README.md
```

🚀 **Next Steps**  
We will incrementally add Terraform configurations into each file.  
