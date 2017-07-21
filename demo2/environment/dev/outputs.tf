output "ssh key fingerprints" {
  value = "${module.ssh_key.fingerprints}"
}
output "droplet ip addresses" {
  value = "${module.load_balancer.ipv4_addresses}"
}
