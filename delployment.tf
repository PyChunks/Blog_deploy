## Lacking in documentation:
## Import provider from Terraform
## New in version .13

terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.17.1"
    }
  }
}

provider "linode" {
  token = var.api_token 
}


resource "linode_instance" "web_server" {
  label = var.server_name
  image = var.server_image
  region = var.server_region
  type = var.server_type

  authorized_keys = [var.public_key]

  root_pass = var.api_token

# Wait for server to be fully up and sshd to be listening to connections
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

# Setting up various files to run  playbook smootly
  provisioner "local-exec"{
    command = "sed -i '/remote_ip/d' ./provision_variables.yml && echo -e '\nremote_ip: ${self.ip_address}' >> ./provision_variables.yml && ssh-keyscan ${self.ip_address} >> ~/.ssh/known_hosts && echo -e '[blog]\n${self.ip_address}' > inventory"
  }

# Install Ansible Playbook dependencies
  provisioner "local-exec"{
    command = "ansible-galaxy install -r requirements.yml"
  }

# Run playbook
  provisioner "local-exec"{
    command = "ansible-playbook -i inventory --private-key='${var.private_key_path}' --extra-vars 'ansible_user=root' provision.yml"
  }
}

