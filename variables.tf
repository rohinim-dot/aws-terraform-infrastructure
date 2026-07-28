variable "aws_region" {
  description = "AWS Region where the infrastructure will be deployed."
  type        = string
  default     = "us-west-2"

  validation {
    condition     = can(regex("^us-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "The AWS Region must be a valid U.S. Region, such as us-west-2 or us-east-1."
  }
}
