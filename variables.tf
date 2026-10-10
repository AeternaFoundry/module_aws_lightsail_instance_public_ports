variable "lightsail_instance_public_ports" {
  description = <<EOT
Map of lightsail_instance_public_ports, attributes below
Required:
    - instance_name
    - port_info (block):
        - cidr_list_aliases (optional)
        - cidrs (optional)
        - from_port (required)
        - ipv6_cidrs (optional)
        - protocol (required)
        - to_port (required)
Optional:
    - region
EOT

  type = map(object({
    instance_name = string
    region        = optional(string)
    port_info = list(object({
      cidr_list_aliases = optional(set(string))
      cidrs             = optional(set(string))
      from_port         = number
      ipv6_cidrs        = optional(set(string))
      protocol          = string
      to_port           = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.lightsail_instance_public_ports : (
        length(v.port_info) >= 1
      )
    ])
    error_message = "Each port_info list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.lightsail_instance_public_ports : (
        alltrue([for item in v.port_info : (item.from_port >= -1 && item.from_port <= 65535)])
      )
    ])
    error_message = "must be between -1 and 65535"
  }
  validation {
    condition = alltrue([
      for k, v in var.lightsail_instance_public_ports : (
        alltrue([for item in v.port_info : (item.to_port >= -1 && item.to_port <= 65535)])
      )
    ])
    error_message = "must be between -1 and 65535"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

