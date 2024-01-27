#!/bin/bash

# cd wp && wp config --dbhost=localhost --dbname=WP_db --dbuser=ST --dbpass=123 --allow-root

#sleep 5

apt install iproute2 -y

apt-get install iputils-ping

wp config set DB_NAME 'WP_DB' --allow-root --path=/wp
wp config set DB_USER 'WP' --allow-root --path=/wp
wp config set DB_PASSWORD '123' --allow-root --path=/wp
wp config set DB_HOST 'mariactr:3306' --allow-root --path=/wp

wp core install --url=localhost --title=TEST --admin_user=king --admin_password=kingpass --admin_email=projectnum05@gmail.com --allow-root --path=/wp


sleep 400000