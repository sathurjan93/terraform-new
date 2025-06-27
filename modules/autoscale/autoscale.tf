resource "aws_autoscaling_group" "web-app-AG" {
  name                 = var.ag_group_name
  min_size             = var.min_size
  max_size             = var.max_size 
  desired_capacity     = var.desired_capacity 
  
  launch_template {
    id      = var.launch_template_id 
    version = "$Latest"
  }

  vpc_zone_identifier = [
    var.prv_sub1,
    var.prv_sub2
  ]

  target_group_arns = [
    var.aws_lb_target_group_arn
  ]

}

resource "aws_autoscaling_policy" "ag-policy" {
  autoscaling_group_name = aws_autoscaling_group.web-app-AG.name
  name                   = "ag-policy"
  policy_type            = "TargetTrackingScaling"
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = var.ag_cpu_target_value 
    }
}