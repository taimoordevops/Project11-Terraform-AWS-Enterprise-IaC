#!/bin/bash
# Cleanup helper for Project 11 AWS resources before terraform destroy
# Requires: AWS CLI + Terraform installed and configured

set -e

echo "=== Cleaning up AWS resources using Terraform outputs ==="

# Get outputs from Terraform
ALB_ARN=$(terraform output -raw alb_arn || true)
TG_ARN=$(terraform output -raw target_group_arn || true)
NAT_EIP_ALLOC=$(terraform output -raw nat_eip_allocation_id || true)

# 1. Delete ALB listeners (if ALB exists)
if [ -n "$ALB_ARN" ] && [ "$ALB_ARN" != "null" ]; then
  echo "Found ALB: $ALB_ARN"
  LISTENERS=$(aws elbv2 describe-listeners --load-balancer-arn "$ALB_ARN" \
    --query "Listeners[*].ListenerArn" --output text)

  for L in $LISTENERS; do
    echo "Deleting listener: $L"
    aws elbv2 delete-listener --listener-arn "$L"
  done
else
  echo "No ALB ARN output found, skipping listener cleanup."
fi

# 2. Deregister targets (optional safety)
if [ -n "$TG_ARN" ] && [ "$TG_ARN" != "null" ]; then
  echo "Found Target Group: $TG_ARN"
  aws elbv2 deregister-targets --target-group-arn "$TG_ARN" \
    --targets Id=i-dummy 2>/dev/null || true
else
  echo "No Target Group ARN output found, skipping deregistration."
fi

# 3. Release NAT EIP
if [ -n "$NAT_EIP_ALLOC" ] && [ "$NAT_EIP_ALLOC" != "null" ]; then
  echo "Releasing Elastic IP allocation: $NAT_EIP_ALLOC"
  aws ec2 release-address --allocation-id "$NAT_EIP_ALLOC" || true
else
  echo "No NAT EIP allocation output found, skipping."
fi

echo "=== Cleanup complete. Now run: terraform destroy -auto-approve ==="