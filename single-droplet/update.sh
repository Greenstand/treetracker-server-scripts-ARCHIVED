#!/bin/bash
cp systemd/* /etc/systemd/user/
systemctl daemon-reload
./stop.sh
cd ../../
cd treetracker-database-migrations
git pull
db-migrate up
cd ../
cd treetracker-mobile-api
git fetch origin master
git checkout deploy.1
git pull
npm install
cd ../
cd treetracker-web-map
git fetch origin master
git checkout deploy.1
git pull
cd server
npm install
cd ../client
npm install
cd ../../
cd treetracker-admin-api
git fetch origin master
git checkout deploy.1
git pull
cd server
npm install
cd ../client
npm install
cd ../../treetracker-server-scripts/single-droplet
./start.sh
journalctl -n 20  -u treetracker-map-api.service
journalctl -n 20  -u treetracker-mobile-api.service
journalctl -n 20  -u treetracker-admin-api.service
systemctl status treetracker-map-api.service
systemctl status treetracker-mobile-api.service
systemctl status treetracker-admin-api.service
