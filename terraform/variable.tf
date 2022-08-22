variable "region" {
    type = string
    default = "us-east-1"
}
variable "ami"{
    type = string
    default = "ami-052efd3df9dad4825"
}
variable "public_key"{
    description = "ssh public key"
}

