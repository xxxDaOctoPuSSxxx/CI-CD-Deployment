include {
    path= find_in_parent_folders()
}

terraform {
    source = "../../modules//deployment" # Terragrunt need (//) to run Terraform correctly
}

locals {
    env_name = replace(path_relative_to_include(), "enviroments/", "")
    app_port = "80"
    app_name = "apache-html"
    fargate_cpu     = "512"
    fargate_memory  = "1024"

}

inputs = {
    #Global Variables
    profile = "default" # Use .aws credentials
    region = "eu-central-1" # Set region to deploy
    env = local.env_name # Set neme of enviroment variables added to tags
    owner = "Roman Hryshchenko" # Set owner name in tags
    project = "Soft_Serve_DevOps_Study" # Set project name in tags
    app_name = local.app_name  # Set Application name in tags

    # Set variables to Network module
    vpc_cidr = "10.0.0.0/16" # Set CIDR_BLOCK to created VPC
    az_count = "2" # Set count of availability zones to deploy in seted region

    # Variable to Security Group module
    app_port     = local.app_port

    # Variable for ECR module
     repository_name = format("%s-%s", local.app_name, local.env_name)
    
    
    # Variables for Auto scaling group
    asg_min              = "1" # minimum running instances
    asg_max              = "2" # maximum running instances
    asg_desired          = "1" #count of starting EC2 instances
    instance_type        = "FARGATE" # type of used EC2 Instance
    
    # Variables for ECS
    fargate_cpu     = local.fargate_cpu
    fargate_memory  = local.fargate_memory
    app_image = ""
    ecs_task_execution_role = "ecsTaskExecutionRole"
}
