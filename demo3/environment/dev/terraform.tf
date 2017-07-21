# VARIABLES

# the token value is passed at runtime
# the other variables are in defined in terraform.tfvars
variable "do_token"      { }
variable "env"           { }
variable "public_keys"   { }
variable "droplet_count" { }
variable "region"        { }
variable "image"         { }

# RESOURCES

# we want a load balancer with certain characteristics
module "load_balancer" {
  source   = "../../modules/load_balancer"
  name     = "demo1"
  count    = "${var.droplet_count}"
  env      = "${var.env}"
  region   = "${var.region}"
  ssh_keys = ["${module.ssh_key.fingerprints}"]
  image    = "${var.image}"
}

# this time we add multiple ssh keys (see terraform.tfvars)
# we could also have a module capable of creating only one ssh-key and use it
# multiple times (e.g module "ssh_key_1", module "ssh_key_2",...)
module "ssh_key" {
  source      = "../../modules/ssh_key"
  env         = "${var.env}"
  public_keys = "${var.public_keys}"
}

# OUTPUTS
# these outputs are not strictly necessary, but they will provide us with some
# values automatically after running terraform apply
output "load balancer ip address" {
  value = "${module.load_balancer.lb_address}"
}

output "droplet ip addresses" {
  value = "${module.load_balancer.droplet_addresses}"
}
