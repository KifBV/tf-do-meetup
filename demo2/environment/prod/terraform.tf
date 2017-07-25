#############
# PROVIDERS #
#############

provider "digitalocean" {
  version = "~> 0.1"
}

#############
# VARIABLES #
#############

variable "env"           { }
variable "public_keys"   { }
variable "droplet_count" { }
variable "region"        { }
variable "image"         { }
variable "droplet_tag"   { }

#############
# RESOURCES #
#############

# we want a load balancer with certain characteristics
# the PROD environment will use a tagged version of the module
module "load_balancer" {
  #source      = "../../modules/load_balancer"
  source   = "github.com/KifBV/tf-do-meetup//demo2/modules/load_balancer?ref=v0.2"
  name        = "demo2"
  count       = "${var.droplet_count}"
  env         = "${var.env}"
  region      = "${var.region}"
  ssh_keys    = ["${module.ssh_key.fingerprints}"]
  image       = "${var.image}"
  droplet_tag = "${var.droplet_tag}"
}

# this time we add multiple ssh keys (see terraform.tfvars)
# we could also have a module capable of creating only one ssh-key and use it
# multiple times (e.g module "ssh_key_1", module "ssh_key_2",...)
# the PROD environment will use a tagged version of the module
module "ssh_key" {
  #source      = "../../modules/ssh_key"
  source      = "github.com/KifBV/tf-do-meetup//demo2/modules/ssh_key?ref=v0.2"
  env         = "${var.env}"
  public_keys = "${var.public_keys}"
}

###########
# OUTPUTS #
###########

# these outputs are not strictly necessary, but they will provide us with some
# values automatically after running terraform apply
output "load balancer ip address" {
  value = "${module.load_balancer.lb_address}"
}

output "droplet ip addresses" {
  value = "${module.load_balancer.droplet_addresses}"
}
