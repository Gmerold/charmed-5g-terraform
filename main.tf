resource "juju_model" "sdcore" {
  name = var.sdcore_model_name
}

module "nrf" {
  source = "./modules/sdcore-nrf"

  model_name = juju_model.sdcore.name
  channel = "edge"
}

module "amf" {
  source = "./modules/sdcore-amf"

  model_name = juju_model.sdcore.name
  channel = "edge"
}