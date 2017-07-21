# Create SSH keys
resource "digitalocean_ssh_key" "mod" {
  count      = "${length(split(",", var.public_keys))}"
  name       = "${var.env}-ssh-key-${count.index}"
  public_key = "${file(element(split(",", var.public_keys), count.index))}"
}
