terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_container" {
  name  = "nginx_container"
  image = docker_image.nginx.name   # ✅ FIXED

  ports {
    internal = 80
    external = 8080
  }
}

output "url" {
  value = "http://localhost:8080"
}