variable "keypair_name" {

  default = "ec2_key_pair"
}

variable "access_key" {

  default = "access_key"
}

variable "secret_key" {

  default = "secret_key"
}

variable "AWS_ACCESS_KEY_ID" {

  description = "Your AWS Access Key ID"
  type        = string
}

variable "AWS_SECRET_ACCESS_KEY" {
  
  description = "Your AWS Secret Access Key ID"
  type        = string
}

# variable "vpc_cidr" {
#   type        = string
#   default     = "10.0.0.0/16"
#   description = "default vpc_cidr_block"
# }

# variable "pub_sub1_cidr_block" {
#   type    = string
#   default = "10.0.1.0/24"
# }

# variable "pub_sub2_cidr_block" {
#   type    = string
#   default = "10.0.2.0/24"
# }
# variable "prv_sub1_cidr_block" {
#   type    = string
#   default = "10.0.3.0/24"
# }
# variable "prv_sub2_cidr_block" {
#   type    = string
#   default = "10.0.4.0/24"
# }

## Autoscaling
# variable "ag_group_name" {
#   type    = string
#   default = "web-app-autoscaling-group"
# }

# variable "min_size" {
#   type    = string
#   default = "1"
# }

# variable "max_size" {
#   type    = string
#   default = "4"
# }

# variable "desired_capacity" {
#   type    = string
#   default = "1"
# }

# variable "ag_cpu_target_value" {
#   type    = string
#   default = "30.0"
# }

# variable "image_id" {
#     type=string
#     default = "ami-007855ac798b5175e"
# }

# variable "instance_type" {
#     type=string
#     default = "t2.micro"
# }