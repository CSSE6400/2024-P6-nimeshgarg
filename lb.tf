resource "aws_lb_target_group" "todo" { 
  name          = "todo" 
  port          = 6400 
  protocol      = "HTTP" 
  vpc_id        = aws_security_group.todo.vpc_id 
  target_type   = "ip" 
 
  health_check { 
    path                = "/api/v1/health" 
    port                = "6400" 
    protocol            = "HTTP" 
    healthy_threshold   = 2 
    unhealthy_threshold = 2 
    timeout             = 5 
    interval            = 10 
  } 
}