#!/bin/bash

sleep 6

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

mkdir /run/php

chown -R root:root /var/www/html

cd /var/www/html && wp core download --allow-root

mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $MARIA_DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $MARIA_DB_USER_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --url=idabligi.42.fr --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/html

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

/usr/sbin/php-fpm7.4 -F