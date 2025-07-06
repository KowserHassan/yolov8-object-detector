resource "aws_lb" "app_alb" {
  name               = var.alb_name
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = var.security_groups

  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    Name        = var.alb_name
    Environment = var.environment
    Project     = var.project_name
  }
}

# Target Group
resource "aws_lb_target_group" "app_target_group" {
  name        = var.target_group_name
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
    timeout             = var.health_check_timeout
    interval            = var.health_check_interval
    path                = var.health_check_path
    matcher             = var.health_check_matcher
    port                = "traffic-port"
    protocol            = var.target_protocol
  }

  depends_on = [aws_lb.app_alb]

  lifecycle {
    create_before_destroy = true
  }
}

# HTTP Listener (redirects to HTTPS)
resource "aws_lb_listener" "app_http" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS Listener
resource "aws_lb_listener" "app_https" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}



