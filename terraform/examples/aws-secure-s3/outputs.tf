output "primary_bucket_name" {
  description = "Name of the primary bucket."
  value       = aws_s3_bucket.primary.id
}

output "logging_bucket_name" {
  description = "Name of the logging bucket."
  value       = aws_s3_bucket.logging.id
}
