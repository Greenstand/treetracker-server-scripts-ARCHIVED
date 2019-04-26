# treetracker-server-scripts

This repo tracks infrastructure as code improvements for the Treetracker project. Right now there is a Packer template used to create a DigitalOcean base image snapshot, and configuration derived from an Ansible playbook. This sets up a new Ubuntu 16.04 Linux system with the dependencies (Nginx, Node.js, Postgres) required to run the treetracker project code.

## TODO

* Deployment playbook 
* PM2 for managing node.js apps
* Configure Nginx
* Install Certbot
* Obtain SSL certificate, set up renewal cronjob

## Roadmap

These tools will be helpful in improving developer productivity and delivery velocity:

- Vagrant
- Terraform
- Docker
- Docker Compose
- Kubernetes
