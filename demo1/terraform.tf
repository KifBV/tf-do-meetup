#############
# VARIABLES #
#############

# Set the variable value in *.tfvars file
# or using -var "do_token=..." CLI option
# Do not expose your token in plain text here!
variable "do_token" {}

# Location of my public key for DO Droplets
# It has a default value but can be overwritten if necessary
variable "ssh_key"  { default = "~/.ssh/id_rsa_do.pub" }

# We also define a default value for the Droplet size
variable "vm_size"  { default = "512mb" }

#############
# PROVIDERS #
#############

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token   = "${var.do_token}"
  version = "~> 0.1"
}

#############
# RESOURCES #
#############

# Create a new Droplet in the fra1 region
resource "digitalocean_droplet" "vm1" {
  image    = "ubuntu-16-04-x64"
  name     = "demo1"
  region   = "fra1"
  size     = "${var.vm_size}"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}

# Create a new SSH key to connect to our Droplet
resource "digitalocean_ssh_key" "default" {
  name       = "default-key"
  public_key = "${file(var.ssh_key)}"
}
