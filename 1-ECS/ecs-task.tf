# ECS task definition
resource "aws_ecs_task_definition" "task_definition" {
  container_definitions    = data.template_file.task_definition_json.rendered
  execution_role_arn       = aws_iam_role.ecsTaskExecutionRole.arn
  family                   = var.ecs-task-name
  network_mode             = "awsvpc"
  memory                   = "3000"
  cpu                      = "1500"
  requires_compatibilities = ["EC2"]
}

data "template_file" "task_definition_json" {
  template = file("${path.module}/task_definition.json")
}