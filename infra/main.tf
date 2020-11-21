terraform {
  backend "local" {
    path = ".terraform.tfstate"
  }
}

provider "null" {
  version = "~> 3.0"
}

module "static_data" {
  source = "../modules/static_data"
}

output "name" {
  value = "${module.static_data.name}"
}

resource "null_resource" "bump" {
  triggers = {
    now = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "touch nothing; rm nothing"
  }
}

