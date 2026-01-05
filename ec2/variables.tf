variable "aws_region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type for backup job"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance (Ubuntu recommended)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04 LTS in us-east-1
}

variable "key_name" {
  description = "Name of the SSH key pair to access EC2"
  type        = string
  default     = "my-keypair"
}

variable "iam_instance_profile" {
  description = "IAM instance profile name attached to EC2 for S3 access"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the EC2 instance"
  type        = map(string)
  default = {
    Name = "cross-cloud-backup"
    Env  = "dev"
  }
}