apt-get install nginx


        location /api/ {
                proxy_pass http://45.55.25.219:3000/;
        }

