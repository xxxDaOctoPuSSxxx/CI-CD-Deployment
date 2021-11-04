include {
    path= find_in_parent_folders()
}

terraform {
    source = "../../modules//network" # Terragrunt need (//) to run Terraform correctly
}

locals {
    env_name = replace(path_relative_to_include(), "enviroments/", "")
    app_port = "80"
    app_name = "Apache-html"

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

    # Variable to Security Group
    app_port     = local.app_port

    # ECR
     repository_name = format("%s-%s", local.app_name, local.env_name)
}
