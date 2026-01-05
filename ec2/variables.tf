variable "aws_region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "EC2 instance type for backup job"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (Ubuntu recommended)"
  type        = string
  default     = "ami-02b8269d5e85954ef" # Ubuntu 20.04 LTS in us-east-1
}

variable "key_name" {
  description = "Name of the SSH key pair to access EC2"
  type        = string
  default     = "stark.pem"
}

variable "iam_instance_profile" {
  description = "IAM instance profile name attached to EC2 for S3 access"
  type        = string
  default     = "aws_iam_instance_profile.s3_read_profile.name"
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default = {
    Name = "cross-cloud-backup"
    Env  = "dev"
  }
}