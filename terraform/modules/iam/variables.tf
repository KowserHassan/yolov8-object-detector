
variable "iam_role_name" {
  description = "Name of the IAM role to create"
  type        = string
}

variable "create_iam_role" {
  description = "Flag to control whether IAM role should be created"
  type        = bool
  default     = true
}
