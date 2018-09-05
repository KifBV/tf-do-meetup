output "fingerprints" {
  value = ["${digitalocean_ssh_key.mod.*.fingerprint}"]
}

output "ids" {
  value = "${join(",", digitalocean_ssh_key.mod.*.id)}"
}
