variable "aws_region" {
  description = "AWS region used for validation and planning."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Primary S3 bucket name."
  type        = string
  default     = "cloud-auditkit-primary-demo-bucket"

  validation {
    condition     = length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63
    error_message = "bucket_name must be between 3 and 63 characters."
  }
}

variable "logging_bucket_name" {
  description = "Logging S3 bucket name."
  type        = string
  default     = "cloud-auditkit-logging-demo-bucket"

  validation {
    condition     = length(var.logging_bucket_name) >= 3 && length(var.logging_bucket_name) <= 63
    error_message = "logging_bucket_name must be between 3 and 63 characters."
  }
}

variable "common_tags" {
  description = "Required tags applied to all resources."
  type        = map(string)
  default = {
    Owner              = "SecurityTeam"
    System             = "CloudAuditKit"
    DataClassification = "Internal"
    Environment        = "Dev"
  }

  validation {
    condition = alltrue([
      contains(keys(var.common_tags), "Owner"),
      contains(keys(var.common_tags), "System"),
      contains(keys(var.common_tags), "DataClassification"),
      contains(keys(var.common_tags), "Environment")
    ])
    error_message = "common_tags must include Owner, System, DataClassification, and Environment."
  }
}
