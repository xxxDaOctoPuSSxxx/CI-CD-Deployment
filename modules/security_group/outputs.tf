output "network_details" {
    value = data.terraform_remote_state.network
}

output "aws_demo_security_group" {
    value = aws_security_group.traffic_rules.id
    description = "id of our created Security Group"
}