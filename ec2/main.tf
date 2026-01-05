provider "aws" {
        region = "ap-south-1"
        profile = "configs"
        default_tags {
            tags = {
              name = "aws"
            }
    

}
}

resource "aws_instance" "backup_ec2" {
  ami           = "ami-02b8269d5e85954ef" 
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.full_admin_profile.name

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "cross-cloud-backup"
  }
}


resource "aws_iam_role" "full_admin_role" {
  name = "ec2-full-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}


resource "aws_iam_role_policy_attachment" "full_admin_attach" {
  role       = aws_iam_role.full_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "full_admin_profile" {
  name = "ec2-full-admin-profile"
  role = aws_iam_role.full_admin_role.name
}
