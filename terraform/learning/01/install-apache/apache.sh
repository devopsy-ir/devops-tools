#!/bin/bash
apt-get update
apt-get install -y php apache2
git clone https://github.com/brikis98/php-app.git /var/www/html/app
service apache2 start
