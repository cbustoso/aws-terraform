variable "puerto_servidor" {
    description = "Puerto para http"
    type = number
    default = 8080
  
}

variable "puerto_ssh" {
    description = "Puerto para ssh"
    type = number
    default = 22
  
}
variable "puerto_ftp" {
    description = "Puerto para ftp"
    type = number
    default = 21
  
}
variable "tipo_instancia" {
    description = "Tipo de instancia EC2"
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    description = "Key pair EC2"
    type = string
    default = ""
}

variable "id_ami" {
    description = "Id Ami AWS"
    type = string
    default = "ami-053b0d53c279acc90"
  
}