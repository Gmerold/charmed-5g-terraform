resource "juju_model" "sdcore" {
  name = var.sdcore_model_name
}

module "mongodb" {
  source = "./modules/terraform-juju-mongodb-k8s"

  application_name = var.db_application_name
  model_name = juju_model.sdcore.name
}

module "certs-provider" {
  source = "./modules/terraform-juju-self-signed-certificates"

  application_name = var.certs_application_name
  model_name = juju_model.sdcore.name
}

module "nrf" {
  source = "./modules/terraform-juju-sdcore-nrf"

  model_name = juju_model.sdcore.name
  channel = "edge"
  db_application_name = var.db_application_name
  certs_application_name = var.certs_application_name
}

module "amf" {
  source = "./modules/terraform-juju-sdcore-amf"

  model_name = juju_model.sdcore.name
  channel = "edge"
  db_application_name = var.db_application_name
  certs_application_name = var.certs_application_name
}
