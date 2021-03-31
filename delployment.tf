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
    # namecheap = {
    #   source  = "robgmills/namecheap"
    #   version = "1.7.0"
    # }
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
    command = "sed -i '/remote_ip/d' ./roles/dns_setup/vars/variables.yml && echo -e '\nremote_ip: ${self.ip_address}' >> ./roles/dns_setup/vars/variables.yml"
  }

  provisioner "local-exec"{
    command = "ssh-keyscan ${self.ip_address} >> ~/.ssh/known_hosts && echo -e '[blog]\n${self.ip_address}' > inventory && ansible-playbook -i inventory --private-key='${var.private_key_path}' --extra-vars 'ansible_user=root' provision.yml"
  }
}

# provider "namecheap" {
#   username = "your_username" # Also set by env variable `NAMECHEAP_USERNAME`
#   api_user = "your_username" # Same as username; also set by env variable `NAMECHEAP_API_USER`
#   token = "your_token" # Also set by env variable `NAMECHEAP_TOKEN`
#   ip = "your.ip.address.here" # Also set by env variable `NAMECHEAP_IP`
#   use_sandbox = false # Toggle for testing/sandbox mode; Also set by env variable `NAMECHEAP_USE_SANDBOX`
# }

# # Create a DNS A Record for a domain you own
# resource "namecheap_record" "www-example-com" {
#   name = "www"
#   domain = "example.com"
#   address = "127.0.0.1"
#   mx_pref = 10
#   type = "A"
# }
