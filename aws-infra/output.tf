output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.subnet_pub.id
}

output "private_subnet_id" {
  value = aws_subnet.sub_private.id
}

output "security_group_id" {
  value = aws_security_group.web_sg.id
}
