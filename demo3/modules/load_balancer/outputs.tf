output "droplet_addresses" {
  value = "${digitalocean_droplet.mod.*.ipv4_address}"
}
output "lb_address" {
  value = "${digitalocean_loadbalancer.mod.ip}"
}
