variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
    token = "${var.do_token}"
}

# Create a web server
resource "digitalocean_droplet" "vingtsept" {
		image = "65047971"
    name = "vingtsept"
    region = "fra1"
    size = "1gb"
}
