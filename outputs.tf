output "lightsail_instance_public_ports_id" {
  description = "Map of id values across all lightsail_instance_public_ports, keyed the same as var.lightsail_instance_public_ports"
  value       = { for k, v in aws_lightsail_instance_public_ports.lightsail_instance_public_ports : k => v.id if v.id != null && length(v.id) > 0 }
}
output "lightsail_instance_public_ports_instance_name" {
  description = "Map of instance_name values across all lightsail_instance_public_ports, keyed the same as var.lightsail_instance_public_ports"
  value       = { for k, v in aws_lightsail_instance_public_ports.lightsail_instance_public_ports : k => v.instance_name if v.instance_name != null && length(v.instance_name) > 0 }
}
output "lightsail_instance_public_ports_port_info" {
  description = "Map of port_info values across all lightsail_instance_public_ports, keyed the same as var.lightsail_instance_public_ports"
  value       = { for k, v in aws_lightsail_instance_public_ports.lightsail_instance_public_ports : k => v.port_info if v.port_info != null && length(v.port_info) > 0 }
}
output "lightsail_instance_public_ports_region" {
  description = "Map of region values across all lightsail_instance_public_ports, keyed the same as var.lightsail_instance_public_ports"
  value       = { for k, v in aws_lightsail_instance_public_ports.lightsail_instance_public_ports : k => v.region if v.region != null && length(v.region) > 0 }
}

