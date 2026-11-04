variable "aws_region" {
  description = "AWS Region where the infrastructure will be deployed."
  type        = string
  default     = "us-west-2"

  validation {
    condition     = can(regex("^us-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "The AWS Region must be a valid U.S. Region, such as us-west-2 or us-east-1."
  }
}

variable "availability_zone_ids" {
  description = "Two Availability Zone IDs for subnet placement."
  type        = list(string)
  default     = ["usw2-az1", "usw2-az2"]

  validation {
    condition     = length(var.availability_zone_ids) == 2 && length(distinct(var.availability_zone_ids)) == 2
    error_message = "Provide exactly two different Availability Zone IDs."
  }
}
