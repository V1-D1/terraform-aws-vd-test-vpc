variable "vpc_config" {
  description = "Value of cidr and name of vpc from user"
  type = object({
    cidr_block = string
    name = string
  })

  validation {
    condition = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Cidr format not correct"
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    Az = string
    public = optional(bool,false)
  }))

  validation {
    condition = alltrue([for config in var.subnet_config: can(cidrnetmask(config.cidr_block))])
    error_message = "Cidr format not correct"
  }
}