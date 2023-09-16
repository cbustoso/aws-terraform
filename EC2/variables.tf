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

variable "tipo_instancia" {
    description = "Tipo de instancia EC2"
    type = string
    default = "t2.micro"
}