variable "env"         { }
variable "region"      { }
variable "ssh_keys"    { type = "list" }
variable "name"        { }
variable "image"       { }
variable "droplet_tag" { }

variable "bootstrap" {
  default = "bootstrap.sh"
}

variable "count"    {
  default = 1
}

variable "size"     {
  default = "512mb"
}

variable "backups" {
  default = "false"
}

variable "ipv6" {
  default = "false"
}

variable "private_networking" {
  default = "false"
}

variable "resize_disk" {
  default = "false"
}

variable "user_data" {
  default = ""
}

#variable "volume_ids" {
#  default = ""
#}
