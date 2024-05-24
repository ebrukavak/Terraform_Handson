variable "key_name" {
 type = string
}

variable "instance_type" {
  default = "t2.micro"
}

variable "server-name" {
  type = string
  default = "Linux-instance"
}