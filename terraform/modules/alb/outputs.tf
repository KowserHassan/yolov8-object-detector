output "alb_id" {
  description = "ALB ID"
  value       = aws_lb.app_alb.id
}

output "alb_arn" {
  description = "ALB ARN"
  value       = aws_lb.app_alb.arn
}

output "alb_dns_name" {
  description = "ALB DNS name"
  value       = aws_lb.app_alb.dns_name
}

output "alb_zone_id" {
  description = "ALB hosted zone ID"
  value       = aws_lb.app_alb.zone_id
}

output "target_group_arn" {
  description = "Target group ARN"
  value       = aws_lb_target_group.app_target_group.arn
}

output "target_group_id" {
  description = "Target group ID"
  value       = aws_lb_target_group.app_target_group.id
}

output "http_listener_arn" {
  description = "HTTP listener ARN"
  value       = aws_lb_listener.app_http.arn
}

output "https_listener_arn" {
  description = "HTTPS listener ARN"
  value       = aws_lb_listener.app_https.arn
}

output "zone_id" {
  value = aws_lb.app_alb.zone_id
}
