# Create a DO load balancer
resource "digitalocean_loadbalancer" "mod" {
  name = "${var.name}-${var.env}-load-balancer"
  region = "${var.region}"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    # use the following when starting/developping
    #port = 22
    #protocol = "tcp"
    port = 80
    protocol = "http"
  }

  droplet_ids = ["${digitalocean_droplet.mod.*.id}"]
}

# Create Droplets to be part of the load-balanced fleet
resource "digitalocean_droplet" "mod" {
  count      = "${var.count}"
  image      = "${var.image}"
  name       = "${var.name}-${var.env}-vm-${count.index}"
  region     = "${var.region}"
  size       = "${var.size}"
  ssh_keys   = ["${var.ssh_keys}"]
  tags       = ["${digitalocean_tag.env.id}","${digitalocean_tag.info.id}"]
  user_data  = "${var.user_data}"
  #volume_ids = ["${split(",", var.volume_ids)}"]

  provisioner "file" {
    source      = "${path.module}/files/${var.bootstrap}"
    destination = "/tmp/${var.bootstrap}"
    # connection details are defaults but i added them for clarity
    connection {
      type = "ssh"
      user = "root"
      agent = "true"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/${var.bootstrap}",
      "/tmp/${var.bootstrap}",
    ]
    # same as above
    connection {
      type = "ssh"
      user = "root"
      agent = "true"
    }
  }
}

resource "digitalocean_tag" "env" {
  name = "${var.env}"
}

resource "digitalocean_tag" "info" {
  name = "terraform_managed"
}
