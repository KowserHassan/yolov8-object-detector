## ECS Resources
resource "aws_ecs_cluster" "app_ecs" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.task_family}"
  retention_in_days = 7
}


# Task Definitions
resource "aws_ecs_task_definition" "app_task" {
  family                   = var.task_family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = data.aws_iam_role.ecs_task_execution_role.arn


  runtime_platform {
    cpu_architecture        = "ARM64"
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name      = "app-ecs",
      image     = "183295408140.dkr.ecr.eu-west-2.amazonaws.com/yolov8ai-app:latest",
      cpu       = 0,
      essential = true,

      portMappings = [
        {
          containerPort = 8080,
          hostPort      = 8080,
          protocol      = "tcp"
        }
      ],

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs_logs.name
          awslogs-region        = "eu-west-2"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}


# ECS Service

resource "aws_ecs_service" "app_service" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.app_ecs.id
  task_definition = aws_ecs_task_definition.app_task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    assign_public_ip = true
    subnets          = var.subnet_ids
    security_groups  = var.security_group_ids
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  deployment_controller {
    type = "ECS"
  }

  depends_on = [var.http_listener_arn]
}

# resource "aws_cloudwatch_log_group" "ecs_container_insights" {
#   name = "/aws/ecs/containerinsights/app_ecs/performance"

#   # lifecycle {
#   #   prevent_destroy = true
#   # }
# }

