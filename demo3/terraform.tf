#############
# PROVIDERS #
#############

provider "digitalocean" {
  version = "~> 0.1"
}

provider "aws" {
  # change the region value according to your own AWS account
  region     = "eu-west-1"
  version = "~> 0.1"
}

###########
# BACKEND #
###########

terraform {
  backend "s3" {
    # change the bucket and region values according to your own AWS account
    bucket  = "tf-do-meetup"
    key     = "terraform.tfstate"
    region  = "eu-west-1"
    encrypt = "true"
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
