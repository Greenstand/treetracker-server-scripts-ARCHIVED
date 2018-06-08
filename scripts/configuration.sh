#!/bin/bash
set -euo pipefail

# Initial 16.04 setup
# https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-16-04

# set username, we're using "deploy" as an example.
USERNAME=deploy

# Create deploy user and add to sudo group
useradd --create-home --shell "/bin/bash" --groups sudo "${USERNAME}"

# Create SSH directory for sudo user
home_directory="$(eval echo ~${USERNAME})"
mkdir --parents "${home_directory}/.ssh"

# Copy the 
cp /root/.ssh/authorized_keys "${home_directory}/.ssh"

# Adjust SSH configuration ownership and permissions
chmod 0700 "${home_directory}/.ssh"
chmod 0600 "${home_directory}/.ssh/authorized_keys"
chown --recursive "${USERNAME}":"${USERNAME}" "${home_directory}/.ssh"

# Allow passwordless sudo
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users

# Disable root SSH login with password
sed --in-place 's/^PermitRootLogin.*/PermitRootLogin no/g' /etc/ssh/sshd_config
if sshd -t -q; then
    systemctl restart sshd
fi

# Add exception for SSH and then enable UFW firewall
ufw allow OpenSSH
ufw --force enable

apt-get update
apt-get -y install nginx

# Manual node.js installation, https://github.com/nodesource/distributions#debmanual
curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
# Replace with the branch of Node.js or io.js you want to install: node_6.x, node_8.x, etc...
NODE_VERSION=node_8.x
# The below command will set this correctly, but if lsb_release isn't available, you can set it manually:
# - For Debian distributions: jessie, sid, etc...
# - For Ubuntu distributions: xenial, bionic, etc...
# - For Debian or Ubuntu derived distributions your best option is to use the codename corresponding to the upstream release your distribution is based off. This is an advanced scenario and unsupported if your distribution is not listed as supported per earlier in this README.
DISTRO="$(lsb_release -s -c)"
echo "deb https://deb.nodesource.com/$NODE_VERSION $DISTRO main" | sudo tee /etc/apt/sources.list.d/nodesource.list
echo "deb-src https://deb.nodesource.com/$NODE_VERSION $DISTRO main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list

apt-get update
apt-get -y install nodejs

# Manual postgres 9.6 installation, add repo and apt-key
echo "deb http://apt.postgresql.org/pub/repos/apt/ ${DISTRO}-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get update
apt-get -y install postgresql-9.6 postgresql-9.6-postgis-2.3 postgresql-contrib-9.6 postgresql-9.6-postgis-scripts

# TODO: Add "treetracker" limited (non-sudo) user, clone treetracker project repos to treetracker's home dir, configure nginx, configure postgres, etc
