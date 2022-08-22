resource "aws_security_group" "allow_ports" {
    ingress {
        description = "allow ssh ports"
        from_port        = 22
        to_port          = 22
        protocol          = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow port for jenkins"
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow port for website"
        from_port = 9000
        to_port = 9000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow port for php"
        from_port = 4000
        to_port = 4000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "allow port for database"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "my-key"
  public_key = var.public_key

   provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > /home/aabaza/Github/online-shoping-system/online-shopping/online-shopping-system/terraform/my-key.pem && chmod 400 /home/aabaza/Github/online-shoping-system/online-shopping/online-shopping-system/terraform/my-key.pem "
    }
 
}