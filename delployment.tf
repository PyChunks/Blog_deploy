## Lacking in documentation:
## Import provider from Terraform

## Lacking in documentation:
## Import provider from Terraform
## New in version .13
## New in version .13

terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.14.3"
    }
  }
}

provider "linode" {
  token = var.api_token 
}


resource "linode_instance" "web_blog" {
  label = "web_blog"
  image = "linode/ubuntu20.04"
  region = "us-east"
  type = "g6-nanode-1"

  authorized_keys = [var.public_key]

  root_pass = var.api_token

  provisioner "remote-exec" {
    inline = ["echo 'Hello World'"]

    connection {
      type        = "ssh"
      user        = "root"
      password    = self.root_pass
      host        = self.ip_address
      private_key = file(var.private_key_path)    
    }
  }


  provisioner "local-exec"{
    command = "sed -i '/remote_ip/d' ./provision_variables.yml && echo -e '\nremote_ip: ${self.ip_address}' >> ./provision_variables.yml"
  }

  provisioner "local-exec"{
    command = "ssh-keyscan ${self.ip_address} >> ~/.ssh/known_hosts && echo -e '[blog]\n${self.ip_address}' > inventory && ansible-playbook -i inventory --private-key='${var.private_key_path}' --extra-vars 'ansible_user=root' provision.yml"
  }
}

