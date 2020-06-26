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
sudo apt-get install mysql-client -y
cd /tmp
curl -O https://wordpress.org/wordpress-5.4.tar.gz
tar xzvf  wordpress-5.4.tar.gz
mv /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
sudo chown -R www-data:www-data wordpress
sudo find wordpress/ -type d -exec chmod 750 {} \;
sudo sudo sed -i -e 's/database_name_here/Wordpress/g' /tmp/wordpress/wp-config.php
sudo sed -i -e 's/username_here/WordpressUser/g' /tmp/wordpress/wp-config.php
sudo sed -i -e 's/password_here/password/g' /tmp/wordpress/wp-config.php
sudo sed -i -e 's/localhost/localhost/g' /tmp/wordpress/wp-config.php
sudo mv wordpress/* /var/www/html/
sudo rm -r /var/www/html/index.html
sudo systemctl restart apache2
