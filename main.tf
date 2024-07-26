provider "aws" {
  region = "us-west-2"
}


resource "null_resource" "execute_script" {
  provisioner "local-exec" {
    command = "bash ./create_resources.sh"
  }
}
