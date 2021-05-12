Web Server automatic deployment
===============================

Terraform project that automatically deploys a Nginx webserver as a Linode VPS. The provisioner also implements basic webserver security and configuration

Requirements
------------

| Ansible | 2.9 |
| Git     |     |

This terraform project uses `Ansible` to provision the remote server. 

Even though the playbook is included in this folder, the various roles are stored on github repositories and are downloaded automatically if needed when running the project. Therefore, `Git` is also needed.

Variables
---------

## Terraform 

## Ansible
