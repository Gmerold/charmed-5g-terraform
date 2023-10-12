resource "juju_application" "mongodb" {
  name = var.application_name
  model = var.model_name

  charm {
    name = "mongodb-k8s"
    channel = var.channel
    series = "jammy"
  }

  units = 1
  trust = true
}
