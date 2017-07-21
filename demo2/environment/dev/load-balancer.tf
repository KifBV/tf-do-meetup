# we want a load balancer with certain characteristics
module "load_balancer" {
  source   = "../../modules/load_balancer"
  name     = "demo1"
  count    = "${var.droplet_count}"
  env      = "${var.env}"
  region   = "${var.region}"
  ssh_keys = ["${module.ssh_key.fingerprints}"]
}

# this time we add 2 ssh keys (see inputs.tf)
# we could also have a module capable of creating only one ssh-key and use it
# multiple times (e.g module "ssh_key_1", module "ssh_key_2",...)
module "ssh_key" {
  source      = "../../modules/ssh_key"
  env         = "${var.env}"
  public_keys = "${var.public_keys}"
}
