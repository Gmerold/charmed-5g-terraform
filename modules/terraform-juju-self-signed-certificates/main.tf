resource "juju_application" "self-signed-certs" {
  name = "self-signed-certificates"
  model = var.model_name

  charm {
    name = "self-signed-certificates"
    channel = var.channel
    series = "jammy"
  }

  units = 1
}
