terraform {
  backend "remote" {
    organization = "tf_rel_path"

    workspaces {
      name = "tf11"
    }
  }
}

provider "null" {
  version = "~> 2.1"
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
    command = "touch nothing"
  }
}
