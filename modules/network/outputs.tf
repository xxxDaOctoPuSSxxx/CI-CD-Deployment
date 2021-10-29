output vpc_id {
  value       = aws_vpc.demo_vpc.id
  description = "output for VPC"
}

output vpc_cidr {
  value       = aws_vpc.demo_vpc.cidr_block
  description = "output for VPC's CIDR_BLOCK"
}