# the token value is passed at runtime
variable "do_token" {}

# below we declare other variables and also give them default values
# these values could also be moved to a terraform.tfvars file
variable "env" {
  default = "development"
}

# we declare 2 public keys
variable "public_keys" {
  default = "~/.ssh/id_rsa_do.pub,~/.ssh/id_rsa_github.pub"
}

# we want to load balance 3 droplets
variable "droplet_count" {
  default = 2
}

variable "region" {
  default = "fra1"
}
