output "aws_region" {
  description = "AWS Region selected for this deployment."
  value       = var.aws_region
}

output "project_name" {
  description = "Name of the project."
  value       = local.project_name
}

output "environment" {
  description = "Deployment environment."
  value       = local.environment
}

output "name_prefix" {
  description = "Standard naming prefix used for AWS resources."
  value       = local.name_prefix
}

# EC2 instance ID for troubleshooting and SSM access
output "app_instance_id" {
  description = "ID of the private application EC2 instance"
  value       = aws_instance.app.id
}

# DNS name of the Application Load Balancer
output "alb_dns_name" {
  description = "DNS name of the public Application Load Balancer"
  value       = aws_lb.app.dns_name
}

# URL for accessing the web application
output "application_url" {
  description = "HTTP URL of the web application"
  value       = "http://${aws_lb.app.dns_name}"
}

# Private IP address of the application EC2 instance
output "app_private_ip" {
  description = "Private IP address of the application EC2 instance"
  value       = aws_instance.app.private_ip
}
