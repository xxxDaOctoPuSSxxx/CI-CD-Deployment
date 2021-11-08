#################################################################
            #Take variables from Terragrunt inputs
#################################################################
variable "profile"{}
variable "region"{}
variable "env" {}
variable "owner" {}
variable "project" {}
variable "app_name" {}

################################################################
            # Variables from Terragrunt for currient module
################################################################
variable "vpc_cidr" {}
variable "az_count" {}

################################################################
            # Variables for security_group
################################################################
variable "app_port" {}        

################################################################
            # Load balancer variables
################################################################
variable "health_check_path" {
  default = "/"
}

################################################################
            # ECR
################################################################
variable "repository_name" {}

################################################################
            # Auto Scaling group
################################################################
variable "asg_min" {}
variable "asg_max" {}
variable "asg_desired" {}
################################################################
            # ECS
################################################################
variable "fargate_cpu" {}
variable "fargate_memory" {}
variable "app_image" {}
variable "ecs_task_execution_role" {}

