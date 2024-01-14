#!bin/sh

mysqld_safe &

mariadb -u root -e "CREAT DATABASE WP_db;"

sleep 4000000