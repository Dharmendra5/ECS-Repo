# Load balancer target group
resource "aws_lb_target_group" "target_group" {
  name        = var.alb-target
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    path = "/"
    interval = 200
    timeout = 60
    protocol = "HTTP"
  }

  tags = {
    Name = var.alb-target
  }
}