#!/usr/bin/env bash
# Script to install and configure Nginx with custom settings

# Add the stable version of Nginx
sudo apt update -y
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:nginx/stable

# Update the package list and install Nginx
sudo apt update -y
sudo apt install -y nginx

# Allow HTTP traffic through the firewall
sudo ufw allow 'Nginx HTTP'

# Set folder permissions for /var/www
sudo chmod -R 755 /var/www

# Create a custom index.html file
echo "Hello World!" | sudo tee /var/www/html/index.html > /dev/null

# Create a custom 404 error page
echo "Ceci n'est pas une page" | sudo tee /var/www/html/404.html > /dev/null

# Configure the Nginx server block
sudo bash -c 'cat > /etc/nginx/sites-available/default << EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    error_page 404 /404.html;

    location /404.html {
        internal;
    }

    location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
    }
}
EOF'

# Restart Nginx to apply changes
sudo systemctl restart nginx

# Ensure Nginx service is running
sudo systemctl enable nginx
sudo systemctl start nginx
