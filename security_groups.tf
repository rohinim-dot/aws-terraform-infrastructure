
# Security group for the Application Load Balancer
resource "aws_security_group" "alb" {
  name        = "${local.name_prefix}-alb-sg"
  description = "Security group for public ALB"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-alb-sg"
  }
}

# Allow HTTP from the internet to the ALB
resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  description       = "Allow inbound HTTP traffic to public ALB"
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Security group for private application servers
resource "aws_security_group" "app" {
  name        = "${local.name_prefix}-app-sg"
  description = "Security group for application servers"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-app-sg"
  }
}

# Allow HTTP only from the ALB
resource "aws_vpc_security_group_ingress_rule" "app_http" {
  description                  = "Allow HTTP traffic from ALB to application servers"
  security_group_id            = aws_security_group.app.id
  referenced_security_group_id = aws_security_group.alb.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# Allow ALB outbound HTTP to application servers
resource "aws_vpc_security_group_egress_rule" "alb_to_app" {
  description                  = "Allow outbound HTTP traffic from ALB to application servers"
  security_group_id            = aws_security_group.alb.id
  referenced_security_group_id = aws_security_group.app.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

# Restrict the VPC default security group
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-default-sg"
  }
}

# Security group for Systems Manager VPC endpoints
resource "aws_security_group" "ssm_endpoints" {
  name        = "${local.name_prefix}-ssm-endpoints-sg"
  description = "Security group for private SSM endpoints"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "${local.name_prefix}-ssm-endpoints-sg"
  }
}

# Allow HTTPS from application EC2 to SSM endpoints
resource "aws_vpc_security_group_ingress_rule" "ssm_https" {
  security_group_id            = aws_security_group.ssm_endpoints.id
  referenced_security_group_id = aws_security_group.app.id

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  description = "Allow HTTPS from application EC2 to SSM endpoints"
}
