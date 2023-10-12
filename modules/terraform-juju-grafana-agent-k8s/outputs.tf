output "grafana_agent_application_name" {
  description = "Name of the deployed application."
  value       = juju_application.grafana-agent.name
}