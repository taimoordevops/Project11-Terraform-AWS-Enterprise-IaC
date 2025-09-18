Project 11 – Terraform AWS Enterprise IaC

This project demonstrates enterprise-grade AWS infrastructure automation using Terraform. It showcases real-world DevOps and Cloud practices by building scalable, secure, and monitored environments.

Key Features & Skills Demonstrated

Networking & Security:

VPC with public/private subnets across Availability Zones (AZs)

Internet Gateway (IGW) + NAT Gateway for controlled internet access

Security groups, route tables, and launch templates following AWS best practices

Compute & Scaling:

EC2 instances running Ubuntu 22.04 LTS

Auto Scaling Group (ASG) for high availability

Application Load Balancer (ALB) with health checks

Target groups & user-data scripts for bootstrapping

Monitoring & Observability:

CloudWatch metrics for CPU, network, and EBS

Alarms configured and verified for operational visibility

Infrastructure as Code (IaC):

Terraform configurations for all AWS resources

Remote state storage in S3

DynamoDB table for state locking

Cost & Resource Management:

Verified proper cleanup with terraform destroy

Ensured CloudWatch alarms and resources do not incur unnecessary costs

📂 **Repo Structure**
```
Project11-terraform-aws-enterprise-iac/
├─ provider.tf
├─ versions.tf
├─ variables.tf
├─ network.tf
├─ ec2.tf
├─ alb.tf
├─ asg.tf
├─ launch_template.tf
├─ nat.tf
├─ sg.tf
├─ target_group.tf
├─ cloudwatch.tf
├─ iam.tf
├─ s3.tf
├─ backend.tf
├─ outputs.tf
├─ terraform.tfvars
├─ cleanup.sh
├─ user_data.sh
├─ .gitignore
├─ screenshots/
└─ README.md
```
⚠️ Terraform state files (terraform.tfstate and terraform.tfstate.backup) are intentionally not listed in repo for security reasons.

Network Architecture
Public & Private Subnets (with IGW + NAT)
+-----------------------------+
|        project11-vpc        |   (10.0.0.0/16)
|                             |
|   +---------------------+    
Internet 🌍 <-----> IGW
|   |   Public Subnet     |   |  (10.0.1.0/24)
|   |  EC2 / ALB / NAT    |   |
|   +---------------------+   |
|            | NAT            |
|            v                |
|   +---------------------+   |
|   |   Private Subnet    |   |  (10.0.101.0/24)
|   |   App / DB Servers  |   |
|   | (Outbound via NAT)  |   |
|   +---------------------+   |
+-----------------------------+


Benefits:

Security: Private workloads isolated from public internet.

Scalability: Public-facing services scale independently of private workloads.

Reliability: Fault-tolerant deployment across AZs.

Verification & Evidence

SSH Access: Ubuntu instances verified via key-based SSH.

Application Test: Apache2 serving test page "✅ Hello from Project11 EC2!".

Auto Scaling Group: Instances automatically registered with ALB and replaced when unhealthy.

CloudWatch Metrics & Alarms: CPU and network metrics monitored; alarms triggered and verified.

Terraform Lifecycle: All resources successfully created and destroyed using Terraform.

Screenshots

SSH & Apache test

ALB dashboard

ASG instance states

CloudWatch metrics and alarms

Terraform plan & apply outputs

Terraform destroy confirmation

(All screenshots included in screenshots/ folder.)

Summary

This project demonstrates hands-on expertise in AWS IaC using Terraform, including:

Designing secure, scalable cloud networks

Automating infrastructure creation and teardown

Implementing monitoring and operational alerts

Managing cost and resource hygiene

It highlights readiness for DevOps, Cloud Engineer, or AWS-focused roles.
