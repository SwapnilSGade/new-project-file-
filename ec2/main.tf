resource "aws_instance" "backup_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Ubuntu 20.04
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.s3_read_profile.name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "cross-cloud-backup"
  }
}