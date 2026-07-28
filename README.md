# Terraform AWS Secure Web Platform

A production-style AWS infrastructure project built with Terraform.

## Project Objective

This project demonstrates how to design, provision, secure, and operate a highly available web application infrastructure on AWS using Infrastructure as Code.

The infrastructure will be deployed across multiple Availability Zones and will use public and private subnets to separate internet-facing resources from internal application and database resources.

## Planned Architecture

The project will include:

* A custom Amazon VPC
* Public and private subnets across two Availability Zones
* Internet Gateway and route tables
* Controlled outbound internet access for private resources
* Application Load Balancer
* Auto Scaling application servers
* IAM roles and least-privilege policies
* Amazon RDS database
* Amazon S3 storage
* CloudWatch monitoring and alarms
* Remote Terraform state
* Separate development and production configurations
* GitHub Actions for Terraform validation and security checks

## Project Goals

* Build reusable and maintainable Terraform configurations
* Follow AWS security and networking best practices
* Avoid hardcoded values and credentials
* Use consistent naming and resource tagging
* Validate infrastructure automatically before deployment
* Document deployment, troubleshooting, and cleanup procedures

## Technologies

* AWS
* Terraform
* Git
* GitHub
* GitHub Actions
* Linux
* Bash
* TFLint
* Infrastructure security scanning

## Project Status

This project is being built incrementally.

Current phase:

* [x] Repository created
* [x] Initial project documentation
* [ ] Terraform configuration
* [ ] AWS provider configuration
* [ ] Networking
* [ ] Security groups and IAM
* [ ] Compute and load balancing
* [ ] Database and storage
* [ ] Monitoring
* [ ] Remote state
* [ ] CI/CD validation

## Security Notice

This repository must not contain:

* AWS access keys
* Secret access keys
* Passwords
* Private keys
* Terraform state files
* Sensitive variable files
* Database credentials

Sensitive values will be managed using secure configuration methods rather than being committed to source control.
