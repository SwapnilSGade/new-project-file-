output "iam_role_arn" {
  description = "ARN of the IAM role with S3 read access"
  value       = aws_iam_role.s3_read_role.arn
}

output "s3_bucket_name" {
  description = "Name of the source S3 bucket"
  value       = var.s3_bucket_name
}