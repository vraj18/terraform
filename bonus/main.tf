terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Dynamic configuration
variable "container_config" {
  type = list(object({
    name = string
    port = number
  }))

  default = [
    { name = "web1", port = 8081 },
    { name = "web2", port = 8082 },
    { name = "web3", port = 8083 }
  ]
}

# Dynamic container creation
resource "docker_container" "nginx" {
  for_each = {
    for c in var.container_config : c.name => c
  }

  name  = each.value.name
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = each.value.port
  }
}

# Output all URLs
output "container_urls" {
  value = [
    for c in var.container_config :
    "http://localhost:${c.port}"
  ]
}