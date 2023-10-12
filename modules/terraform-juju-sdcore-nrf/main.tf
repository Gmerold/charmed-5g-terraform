resource "juju_application" "nrf" {
  name = "nrf"
  model = var.model_name

  charm {
    name = "sdcore-nrf"
    channel = var.channel
    series = "jammy"
  }

  units = 1
  trust = true
}

resource "juju_integration" "nrf-db" {
  model = var.model_name

  application {
    name     = juju_application.nrf.name
    endpoint = "database"
  }

  application {
    name     = var.db_application_name
    endpoint = "database"
  }
}
