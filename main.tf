provider "juju" {
  source = "juju/juju"
}

module "nrf" {
  source = "./modules/sdcore-nrf"

  model_name = var.model_name
  channel = "edge"
}

module "amf" {
  source = "./modules/sdcore-amf"

  model_name = var.model_name
  channel = "edge"
}