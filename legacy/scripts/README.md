This is largely inspired by this tutorial and example repo:

https://github.com/Artemmkin/infrastructure-as-code-tutorial

https://github.com/Artemmkin/infrastructure-as-code-example

Additionally, initial server setup is automated and the configuration script is expected to be passed in the "User Data" field when creating a new droplet virtual server, as inspired by https://github.com/do-community/automated-setups/tree/master/Ubuntu-18.04

The `scripts` directory contains two shell scripts:

`configuration.sh` is going to perform initial configuration for an Ubuntu 16.04 Linux system, and is also set up to be run as User Data.

it will make sense to call this script from a tool such as Hashicorp Packer for building images, or from Vagrant for spinning up a local dev instance.

`deploy.sh` will copy application code from github repos, run the necessary npm commands for installation of dependencies, and start the systemd services.

Longer term, replace with configuration management tooling (e.g. Ansible, chef, puppet, et cetera), create new virtual server infrastructure with the Terraform orchastration tool using pre-built Packer snapshots, or implement a Docker workflow in order to be ready for container orchestration tooling (kubernetes)
