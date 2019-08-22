#!/bin/bash
systemctl stop treetracker-admin-api
cd treetracker-admin-api
cd server
npm run-script build
cd ../
cd client
npm run-script build
\rm -Rf /var/www/admin/*
cp -Rp build/* /var/www/admin/
cd ../../
systemctl start treetracker-admin-api
