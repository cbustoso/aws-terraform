provider "aws" {
  region = "us-east-1"
}

data "aws_subnet" "az_a" {
  availability_zone = "us-east-1a"
}

resource "aws_instance" "servidor_1" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = var.tipo_instancia
  subnet_id              = data.aws_subnet.az_a.id
  vpc_security_group_ids = [aws_security_group.LabIaC.id]

  user_data = <<-EOF
            #!/bin/bash
            echo "Laboratorio Final Dojo IaC" > index.html
            nohup busybox httpd -f -p ${var.puerto_servidor} &
            EOF

  tags = {
    Name = "Servidor-1"
  }
}

resource "aws_security_group" "LabIaC" {
  name = "LabIaC"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description     = "Acceso al puerto 8080"
    from_port       = var.puerto_servidor
    to_port         = var.puerto_servidor
    protocol        = "TCP"
  }
    ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Acceso al puerto 22"
    from_port   = var.puerto_ssh
    to_port     = var.puerto_ssh
    protocol    = "tcp"
   
  }
}