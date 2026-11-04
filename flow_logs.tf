
# Store VPC Flow Logs in Amazon CloudWatch Logs
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/vpc/${local.name_prefix}/flow-logs"
  retention_in_days = 7

  tags = {
    Name = "${local.name_prefix}-vpc-flow-logs"
  }
}
