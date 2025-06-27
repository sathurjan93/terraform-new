resource "aws_lb" "web-app-LB" {
  name               = "web-app-LB"
  internal           = false
  load_balancer_type = "application"

  subnets = [
    var.pub_sub1,
    var.pub_sub2
  ]

  security_groups = [var.security_groups_id]

  tags = {
    Name = "web-app-lb"
  }
 }

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.web-app-LB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-app-TG.arn
  }
}

resource "aws_lb_target_group" "web-app-TG" {
  name     = "web-app-TG"
  port     = 80
  protocol = "HTTP"

  target_type = "instance"

  vpc_id = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 5
  }

  depends_on = [
    aws_lb.web-app-LB
  ]
}