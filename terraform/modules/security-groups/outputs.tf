

output "security_group_ids" {
  description = "Security group ID for the application"
  value       = [aws_security_group.app_sg.id]
}


output "app_security_group_arn" {
  description = "Security group ARN for the application"
  value       = aws_security_group.app_sg.arn
}

