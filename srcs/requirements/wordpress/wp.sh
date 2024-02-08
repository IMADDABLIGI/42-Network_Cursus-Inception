#!/bin/bash

sleep 10

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

mkdir /run/php

chown -R root:root /var/www/html

cd /var/www/html && wp core download --allow-root

mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

wp config set DB_NAME 'WP_DB' --allow-root --path=/var/www/html
wp config set DB_USER 'WP' --allow-root --path=/var/www/html
wp config set DB_PASSWORD '123' --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --url=localhost --title=INCEPTION --admin_user=king --admin_password=kingpass --admin_email=projectnum05@gmail.com --allow-root --path=/var/www/html

wp user create ahmed ahmed.folan@gmail.com --role=author --user_pass=ahmedpass --allow-root --path=/var/www/html

/usr/sbin/php-fpm7.4 -F