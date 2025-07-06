output "zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = var.zone_id
}

output "record_name" {
  description = "The name of the Route 53 DNS record created"
  value       = var.use_alias_record ? aws_route53_record.app_alias[0].name : aws_route53_record.app[0].name
}

output "domain_name" {
  description = "Domain name"
  value       = var.domain_name
}

output "record_fqdn" {
  description = "Fully qualified domain name of the created Route 53 record"
  value       = var.use_alias_record ? aws_route53_record.app_alias[0].fqdn : aws_route53_record.app[0].fqdn
}


