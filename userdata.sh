#!/bin/bash
apt-get update -y
apt-get upgrade -y
apt install apache2 -y
apt install ufw -y
ufw allow 'Apache Full'
apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
apt-get update -y
apt install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql -y
systemctl restart apache2
apt-get update -y
apt-get upgrade -y
apt-get install mysql-client -y
cd /tmp
curl -O https://wordpress.org/wordpress-5.4.tar.gz
tar xzvf  wordpress-5.4.tar.gz
mv /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
sudo chown -R www-data:www-data wordpress
sudo find wordpress/ -type d -exec chmod 750 {} \;
sed -i -e 's/database_name_here/Wordpress/g' /tmp/wordpress/wp-config.php
sed -i -e 's/username_here/WordpressUser/g' /tmp/wordpress/wp-config.php
sed -i -e 's/password_here/password/g' /tmp/wordpress/wp-config.php
sed -i -e 's/localhost/localhost/g' /tmp/wordpress/wp-config.php
mv wordpress/* /var/www/html/
rm -r /var/www/html/index.html
systemctl restart mysql
systemctl restart apache2
