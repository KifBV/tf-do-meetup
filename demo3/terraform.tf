#############
# PROVIDERS #
#############

provider "digitalocean" {
  version = "~> 0.1"
}

provider "aws" {
  region     = "eu-west-1"
  version = "~> 0.1"
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

# none, the only variables we're using here are the do/aws credentials ones and
# they're passed in as environment variables

#############
# RESOURCES #
#############

resource "digitalocean_domain" "default" {
  name       = "franck.live"
  ip_address = "10.0.0.15"
}
