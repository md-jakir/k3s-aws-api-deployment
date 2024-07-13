# outputs.tf

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "nginx_lb_public_ip" {
  value = aws_instance.nginx_lb.public_ip
}

output "k3s_master_private_ip" {
  value = aws_instance.k3s_master.private_ip
}

output "k3s_agent_private_ips" {
  value = [aws_instance.k3s_agent[*].private_ip]
}