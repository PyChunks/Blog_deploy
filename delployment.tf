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
  image = "linode/centos8"
  region = "us-east"
  type = "g6-nanode-1"

  authorized_keys = [var.public_key]

  root_pass = var.api_token

}
