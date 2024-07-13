resource "aws_instance" "bastion" {
  ami           = var.bastion_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[0].id
  security_groups = [aws_security_group.bastion_sg.id]

  tags = {
    Name = "Bastion Host"
  }
}

resource "aws_instance" "nginx_lb" {
  ami           = var.nginx_lb_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public[1].id
  security_groups = [aws_security_group.nginx_lb_sg.id]

  tags = {
    Name = "Nginx Load Balancer"
  }
}

resource "aws_instance" "k3s_master" {
  ami           = "your_k3s_master_ami"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.private[0].id
  security_groups = [aws_security_group.k3s_sg.id]

  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=${var.k3s_version} sh -",
      "sudo k3s server --node-ip ${self.private_ip} --cluster-init"
    ]
  }

  tags = {
    Name = "k3s Master"
  }
}

resource "aws_instance" "k3s_agent" {
  ami           = "your_k3s_agent_ami"
  instance_type = "t2.medium"
  subnet_id     = aws_subnet.private[1].id
  security_groups = [aws_security_group.k3s_sg.id]

  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | K3S_URL=https://${aws_instance.k3s_master.private_ip}:6443 K3S_TOKEN=${var.k3s_token} sh -",
      "sudo k3s agent"
    ]
  }

  tags = {
    Name = "k3s Agent"
  }
}