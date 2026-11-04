
# S3 bucket for Application Load Balancer access logs
resource "aws_s3_bucket" "alb_logs" {
  bucket_prefix = "${local.name_prefix}-alb-logs-"

  force_destroy = true

  tags = {
    Name = "${local.name_prefix}-alb-logs"
  }
}
