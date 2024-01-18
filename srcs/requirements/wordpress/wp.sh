#!/bin/bash

# cd wp && wp config --dbhost=localhost --dbname=WP_db --dbuser=ST --dbpass=123 --allow-root

sleep 5

apt install iproute2 -y

apt-get install iputils-ping

wp config set DB_NAME 'WP_db' --allow-root --path=/wp
wp config set DB_USER 'ST' --allow-root --path=/wp
wp config set DB_PASSWORD '123' --allow-root --path=/wp
wp config set DB_HOST 'mariactr:3306' --allow-root --path=/wp

sleep 4000000