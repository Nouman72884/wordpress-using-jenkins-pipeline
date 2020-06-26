#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt install apache2 -y
sudo apt install ufw -y
sudo ufw allow 'Apache Full'
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y
sudo apt install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql -y
sudo systemctl restart apache2
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install mysql-server -y
sudo apt-get install -y expect
sudo systemctl restart mysql
cd /var/www/html
sudo curl -O https://wordpress.org/wordpress-5.4.tar.gz
sudo tar xzvf  wordpress-5.4.tar.gz
sudo mv wordpress/wp-config-sample.php wordpress/wp-config.php
sudo chown -R www-data:www-data wordpress
sudo find wordpress/ -type d -exec chmod 750 {} \;
sudo sed -i -e 's/database_name_here/WordPress/g' wordpress/wp-config.php
sudo sed -i -e 's/username_here/WordpressUser/g' wordpress/wp-config.php
sudo sed -i -e 's/password_here/password/g' wordpress/wp-config.php
sudo sed -i -e 's/localhost/localhost/g' wordpress/wp-config.php
cd /var/www/html
sudo rm index.html
sudo mv /wordpress/* .
sudo systemctl restart apache2
