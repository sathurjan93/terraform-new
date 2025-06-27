resource "aws_launch_template" "launch_template" {
  name_prefix = "web-app-template"
  
  image_id = var.image_id 
  instance_type =  var.instance_type 
  
  key_name = var.keypair_name
  
  vpc_security_group_ids = [var.security_groups_id]

  user_data = filebase64("./modules/launch_template/serverinstall.sh")


  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "web-app"
    }
  }
}