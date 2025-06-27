# module "vpc" {
#   source              = "./modules/vpc"
#   vpc_cidr            = var.vpc_cidr
#   pub_sub1_cidr_block = var.pub_sub1_cidr_block
#   pub_sub2_cidr_block = var.pub_sub2_cidr_block
#   prv_sub1_cidr_block = var.prv_sub1_cidr_block
#   prv_sub2_cidr_block = var.prv_sub2_cidr_block

# }

# module "keypair" {
#   source       = "./modules/keypair"
#   keypair_name = var.keypair_name

# }

# module "security_group" {
#   source = "./modules/security_group"
# }

# module "security_group" {
#   source = "./modules/security_group"
#   vpc_id = module.vpc.vpc_id

# }

# module "launch_template" {
#   source             = "./modules/launch_template"
#   security_groups_id = module.security_group.security-group-id
#   keypair_name       = var.keypair_name
#   image_id = var.image_id
#   instance_type = var.instance_type

# }

# module "elb" {
#   source             = "./modules/elb"
#   security_groups_id = module.security_group.security-group-id
#   vpc_id             = module.vpc.vpc_id
#   pub_sub1           = module.vpc.pub_sub1
#   pub_sub2           = module.vpc.pub_sub2

# }

# module "autoscale" {
#   source                  = "./modules/autoscale"
#   launch_template_id      = module.launch_template.launch_template
#   aws_lb_target_group_arn = module.elb.aws_lb_target_group_arn
#   prv_sub1                = module.vpc.prv_sub1
#   prv_sub2                = module.vpc.prv_sub2
#   ag_group_name           = var.ag_group_name
#   min_size                = var.min_size
#   max_size                = var.max_size
#   desired_capacity        = var.desired_capacity
#   ag_cpu_target_value     = var.ag_cpu_target_value
#   depends_on = [
#     module.launch_template.aws_launch_template,
#     module.elb.aws_lb_target_group
#   ]
# }
