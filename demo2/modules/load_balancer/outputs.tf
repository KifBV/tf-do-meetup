output "ipv4_addresses" {
  value = "${digitalocean_droplet.mod.*.ipv4_address}"
}
