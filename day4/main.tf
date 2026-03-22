terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# First container
module "container1" {
  source = "./modules/nginx_container"

  container_name = "nginx1"
  container_port = 8081
  image_name     = docker_image.nginx.name
}

# Second container
module "container2" {
  source = "./modules/nginx_container"

  container_name = "nginx2"
  container_port = 8082
  image_name     = docker_image.nginx.name
}

# Output
output "urls" {
  value = [
    "http://localhost:8081",
    "http://localhost:8082"
  ]
}