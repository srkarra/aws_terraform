# Create IAM Role with policy
resource "aws_iam_role" "test_role" {
  name = "test_role"

  assume_role_policy = "${file("policies.json")}"

  tags = {
    tag-key = "tag-value"
  }
}
#Create Multiple IAM user's
resource "aws_iam_user" "Users" {
    count = length(var.username)
    name = var.username[count.index]
}
# Create multiple IAM roles
resource "aws_iam_role" "iamRoles" {
  count = length(var.rolename)
  name = var.rolename[count.index]
  assume_role_policy = file("policies.json")
}
output awsAccountInfo {
  value       = var.aws_access_key
  sensitive   = true
  description = "description"
  depends_on  = []
}
output "arnNumbers-for-Users"{
  value = aws_iam_user.Users[*].arn
  description = "arn numbers for users created"
}
output "armNumbers-for-Roles"{
  value = aws_iam_role.iamRoles[*].arn
  description = "arn numbers for roles created"
}