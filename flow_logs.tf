
# Store VPC Flow Logs in Amazon CloudWatch Logs
resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name              = "/aws/vpc/${local.name_prefix}/flow-logs"
  retention_in_days = 7

  tags = {
    Name = "${local.name_prefix}-vpc-flow-logs"
  }
}

# IAM role that VPC Flow Logs can assume
resource "aws_iam_role" "vpc_flow_logs" {
  name = "${local.name_prefix}-vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "vpc-flow-logs.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "${local.name_prefix}-vpc-flow-logs-role"
  }
}

# Allow VPC Flow Logs to publish records to CloudWatch
resource "aws_iam_role_policy" "vpc_flow_logs" {
  name = "${local.name_prefix}-vpc-flow-logs-policy"
  role = aws_iam_role.vpc_flow_logs.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ]
        Resource = "${aws_cloudwatch_log_group.vpc_flow_logs.arn}:*"
      }
    ]
  })
}
