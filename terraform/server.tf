resource "aws_instance" "ubuntu" {
    ami     = var.ami
    instance_type    = "t2.micro"
    key_name = "my-key"
    security_groups = ["${aws_security_group.allow_ports.name}"]
    tags = {
        Name = "online-website"
    }
}