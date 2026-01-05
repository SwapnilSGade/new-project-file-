variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "s3_bucket_name" {
  description = "Existing S3 bucket name to back up"
  type        = string
  default     = "stark-swapnil-media "
}

variable "iam_role_name" {
  description = "Name of IAM role for S3 read access"
  type        = string
  default     = "s3-read-role"
}