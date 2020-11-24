# Create IAM Role with policy
resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}
#Create Multiple IAM user's
resource "aws_iam_user" "Users" {
    count = length(var.username)
    name = var.username[count.index]
}
output awsAccountInfo {
  value       = var.aws_access_key
  sensitive   = true
  description = "description"
  depends_on  = []
}
output "arnNumbers"{
  value = aws_iam_user.Users[*].arn
  description = "Arn numers of all users"
}