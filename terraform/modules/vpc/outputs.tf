output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_route_table_ids" {
  value = [aws_route_table.private.id]
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "ec2_sg_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2_sg.id
}
