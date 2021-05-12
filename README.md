Web Server automatic deployment
===============================

Terraform project that automatically deploys a Nginx webserver as a Linode VPS. The provisioner also implements basic webserver security and configuration.

Requirements
------------

| Dependency | Version    |
| :--------- | ---------: |
| Ansible    | 2.9        |
| Git        |            |

This terraform project uses `Ansible` to provision the remote server. 

Even though the playbook is included in this folder, the various roles are stored on github repositories and are downloaded automatically if needed when running the project. Therefore, `Git` is also needed.

Variables
---------

### Terraform 

`api_token` should be set to your Linode provided API token. See the [doccumentation](https://www.linode.com/docs/guides/getting-started-with-the-linode-api/) for more details.

`public_key` should be set to your the ssh public key allowed for your Linode account. See the [doccumentation](https://www.linode.com/docs/guides/use-public-key-authentication-with-ssh/) for more details.

`private_key_path` should be set to the path of the private ssh key allowed for your account (the one matching the previous public_key variable). This is set by default to `~/.ssh/id_rsa` (the default ssh key).

`server_name` should be set to your desired linode name. Defaults to `example.com`. 

`server_region` should be set to your desired server region. Defaults to `ca-central`. See the [doccumentation](https://www.linode.com/docs/api/regions/) to learn how to get a list of available options.

`server_image` should be set to your desired OS image. Defaults to `linode/ubuntu20.04`. See the [doccumentation](https://www.linode.com/docs/api/images/) to learn how to get a list of available options.

`server_type` shoudl be set to your desired linode type. Defaults to the cheapest linode `g6-nanode-1`. See the [doccumentation](https://www.linode.com/docs/api/linode-types/) to learn how to get a list of available options.

### Ansible
