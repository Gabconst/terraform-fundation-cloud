output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets_ids" {
  value = aws_subnet.public[*].id
}

output "private_app_subnets_ids" {
  value = aws_subnet.private_app[*].id
}

output "private_db_subnets_ids" {
  value = aws_subnet.private_db[*].id
}

output "nat_gateway_ip" {
  value = aws_eip.nat.public_ip
}
