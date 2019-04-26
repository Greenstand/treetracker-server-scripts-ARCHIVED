set -e
cd /root/treetracker-admin-api
git pull
systemctl restart treetracker-admin-api.service
