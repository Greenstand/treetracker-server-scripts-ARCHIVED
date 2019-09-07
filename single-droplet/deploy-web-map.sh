#!/bin/bash

cd treetracker-web-map
cd server
npm install
cd ../client
\rm -Rf /var/www/html/*
cp -Rp * /var/www/html/
cd ../../

