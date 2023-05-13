terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}

resource "docker_image" "img-exporter" {
    name = "danielqsj/kafka-exporter"
}

resource "docker_container" "exporter" {
    name = "exporter"
    image = docker_image.img-exporter.image_id
    #env = ["kafka.server=192.168.89.161:9092"]

    ports {
        internal = 9308
        external = 9308
    }

    command = ["--kafka.server=192.168.89.161:9092"]

    restart = "always"
}