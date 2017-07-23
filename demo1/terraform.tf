#############
# PROVIDERS #
#############

# A provider usually needs credentials. Here, we use the DIGITALOCEAN_TOKEN
# environment variable which is used in last resort.  Also, the version can be
# (and should be) pinned with Terraform v0.10 and above. If you remove that
# option from the provider block and run 'terraform init', this is what
# Terraform will suggest.

provider "digitalocean" {
  version = "~> 0.1"
}

#############
# VARIABLES #
#############

# Set the token value using -var "do_token=<token>" as a CLI option (using e.g.
# an environment variable or shell expansion).
# Do not expose your token in plain text here!

variable "do_token" { }

# Location of my public key for DO Droplets. It has a default value that can be
# overwritten in terraform.tfvars or at the CLI if necessary.

variable "ssh_key"  { default = "~/.ssh/id_rsa_do.pub" }

# We also declare a variable for the Droplet size. Its value is set in
# terraform.tfvars but again, we can overwrite it at the CLI (try to add '-var
# droplet_size="1gb"' to the terraform plan command).

variable "droplet_size"  { }

#############
# RESOURCES #
#############

# Some options are required, others are optional (see the provider's docs). The
# value for the 'ssh_keys' variable is the 'fingerprint' output of the
# 'digitalocean_ssh_key' resource.

resource "digitalocean_droplet" "vm1" {
  image    = "ubuntu-16-04-x64"
  name     = "demo1"
  region   = "fra1"
  size     = "${var.droplet_size}"
  ssh_keys = ["${digitalocean_ssh_key.default.fingerprint}"]
}

# Terraform also provides useful interpolations. Here we get the value for the
# 'public_key' variable from the content of a file.

resource "digitalocean_ssh_key" "default" {
  name       = "default-key"
  public_key = "${file(var.ssh_key)}"
}
