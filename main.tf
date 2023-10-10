resource "juju_model" "juju_model" {
  name = var.model_name
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