terraform {
  required_providers {
    docker = {
      source = "https://hub.docker.com/r/tutum/hello-world/"
    }
  }
}

provider "docker" {}

resource "docker_image" "tutum/hello-world" {
  name         = "tutum/hello-world:latest"
  keep_locally = false
}

resource "docker_container" "tutum/hello-world" {
  image = docker_image.tutum/hello-world.latest
  name  = "tutorial"
  ports {
    internal = 80
    external = 8000
  }
}
