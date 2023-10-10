resource "juju_application" "amf" {
  name = "amf"
  model = var.model_name

  charm {
    name = "sdcore-nrf"
    channel = var.channel
  }

  units = 1
  trust = true
}

resource "juju_application" "nrf" {
  name = "nrf"
  model = var.model_name

  charm {
    name = "sdcore-nrf"
    channel = var.channel
  }

  units = 1
  trust = true
}

resource "juju_application" "mongodb" {
  name = "mongodb"
  model = var.model_name

  charm {
    name = "mongodb-k8s"
    channel = "5/edge"
  }

  units = 1
  trust = true
}

resource "juju_integration" "nrf-mongodb" {
  model = var.model_name

  application {
    name     = juju_application.nrf.name
    endpoint = "database"
  }

  application {
    name     = juju_application.mongodb.name
    endpoint = "database"
  }
}

resource "juju_integration" "amf-mongodb" {
  model = var.model_name

  application {
    name     = juju_application.amf.name
    endpoint = "database"
  }

  application {
    name     = juju_application.mongodb.name
    endpoint = "database"
  }
}

resource "juju_integration" "amf-nrf" {
  model = var.model_name

  application {
    name     = juju_application.amf.name
    endpoint = "fiveg-nrf"
  }

  application {
    name     = juju_application.nrf.name
    endpoint = "fiveg-nrf"
  }
}
