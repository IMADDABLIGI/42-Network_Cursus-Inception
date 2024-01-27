#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

mkdir wp && cd wp && wp core download --allow-root

mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

apt install iproute2 -y
apt-get install iputils-ping

wp config set DB_NAME 'WP_DB' --allow-root --path=/wp
wp config set DB_USER 'WP' --allow-root --path=/wp
wp config set DB_PASSWORD '123' --allow-root --path=/wp
wp config set DB_HOST 'mariactr:3306' --allow-root --path=/wp

wp core install --url=localhost --title=TEST --admin_user=king --admin_password=kingpass --admin_email=projectnum05@gmail.com --allow-root --path=/wp

sleep 400000