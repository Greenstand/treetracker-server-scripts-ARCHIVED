# treetracker-server-scripts

Configuration and deployment scripts are being worked on in the `scripts` directory. This sets up a new Ubuntu 16.04 Linux system with the dependencies (Nginx, Node.js, Postgres) required to run the treetracker project code.

## TODO

* Add UFW rule for Nginx
* Create non-sudo user `treetracker` to run nodejs apps
* Create deployment script 
* Add systemd service files
* Configure Nginx
* Install Certbot
* Obtain SSL certificate, set up renewal cronjob
* Packer, Ansible, Terraform, Docker, etc
