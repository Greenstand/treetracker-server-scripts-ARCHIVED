set -e
cd /var/www/html
git pull
cd /root/treetracker-map-api
git pull
systemctl restart treetracker-map-api.service
