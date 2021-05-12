Web Server automatic deployment
===============================

Terraform project that automatically deploys a Nginx webserver as a Linode VPS. The provisioner also implements basic webserver security and configuration

Requirements
------------

<<<<<<< HEAD
| Dependency | Version    |
| :--------- | ---------: |
| Ansible    | 2.9        |
| Git        |            |
=======
| Ansible | 2.9 |
|---------|-----|
| Git     |     |
>>>>>>> 21b023f8c94b8b24e0580738a0cf450b6821d702

This terraform project uses `Ansible` to provision the remote server. 

Even though the playbook is included in this folder, the various roles are stored on github repositories and are downloaded automatically if needed when running the project. Therefore, `Git` is also needed.

Variables
---------

## Terraform 

## Ansible
