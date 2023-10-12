resource "juju_model" "sdcore" {
  name = var.sdcore_model_name
}

module "mongodb" {
  source = "./modules/terraform-juju-mongodb-k8s"

  model_name = juju_model.sdcore.name
}

module "certs-provider" {
  source = "./modules/terraform-juju-self-signed-certificates"

  model_name = juju_model.sdcore.name
}

module "grafana-agent" {
  source = "./modules/terraform-juju-grafana-agent-k8s"

  model_name = juju_model.sdcore.name
}

module "nrf" {
  source = "./modules/terraform-juju-sdcore-nrf"

  model_name = juju_model.sdcore.name
  channel = "edge"
  db_application_name = module.mongodb.db_application_name
  certs_application_name = module.certs-provider.certs_application_name
}

module "amf" {
  source = "./modules/terraform-juju-sdcore-amf"

  model_name = juju_model.sdcore.name
  channel = "edge"
  db_application_name = module.mongodb.db_application_name
  certs_application_name = module.certs-provider.certs_application_name
  nrf_application_name = module.nrf.nrf_application_name
}
