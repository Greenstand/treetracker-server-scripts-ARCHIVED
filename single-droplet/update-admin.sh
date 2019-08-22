#!/bin/bash

cd treetracker-admin-api
git fetch origin master
git reset --hard
git checkout deploy.1
git pull
cd server
npm install
cd ../client
npm install
npm run-script build
\rm -Rf /var/www/admin/*
cp -Rp build/* /var/www/admin/
cd ../../

