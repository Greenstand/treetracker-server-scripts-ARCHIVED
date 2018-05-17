set -e
cd /var/www/admin
git pull
cd /root/treetracker-admin-api
git pull
systemctl restart treetracker-admin-api.service
