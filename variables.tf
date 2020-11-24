variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}
variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}
variable "aws_region" {
  type        = string
  description = "AWS region"
}
variable "username"{
  description = "Create IAM users with this list"
  type = "list"
  default = ["user1", "user2", "user3"]
}