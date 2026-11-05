
# Interface VPC endpoint for AWS Systems Manager
resource "aws_vpc_endpoint" "ssm" {
  vpc_id              = aws_vpc.main.id
  service_name        = "com.amazonaws.${var.aws_region}.ssm"
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  subnet_ids = [
    aws_subnet.private[0].id
  ]

  security_group_ids = [
    aws_security_group.ssm_endpoints.id
  ]

  tags = {
    Name = "${local.name_prefix}-ssm-endpoint"
  }
}
