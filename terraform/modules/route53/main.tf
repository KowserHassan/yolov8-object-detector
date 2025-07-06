
resource "aws_route53_record" "app" {
  count   = var.use_alias_record ? 0 : 1

  zone_id = var.zone_id
  name    = var.subdomain
  type    = "CNAME"
  ttl     = var.ttl
  records = [var.alb_dns_name]
}

resource "aws_route53_record" "app_alias" {
  count   = var.use_alias_record ? 1 : 0

  zone_id = var.zone_id
  name    = var.subdomain
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}
