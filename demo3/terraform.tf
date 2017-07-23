#############
# PROVIDERS #
#############

provider "digitalocean" {
  token   = "${var.do_token}"
  version = "~> 0.1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "eu-west-1"
}

###########
# BACKEND #
###########

terraform {
  backend "s3" {
    bucket = "tf-do-meetup"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}

#############
# VARIABLES #
#############

variable "do_token"       { }
variable "aws_access_key" { }
variable "aws_secret_key" { }

#############
# RESOURCES #
#############

resource "digitalocean_domain" "default" {
  name       = "franck.live"
  ip_address = "10.0.0.10"
}
