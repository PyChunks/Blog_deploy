variable "api_token" {
  type = string
  default = ""
}


variable "public_key" {
  type = string
  default = ""
}

variable "private_key_path" {
  type = string
  default = ""
}

variable "server_name" {
  type = string
  default = ""
}


variable "server_region" {
  type = string
  default = "ca-central"
}

variable "server_image" {
  type = string
  default = "linode/ubuntu20.04"
}


variable "server_type" {
  type = string
  default = "g6-nanode-1"
}
