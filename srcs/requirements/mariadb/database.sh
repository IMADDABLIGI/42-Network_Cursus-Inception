#!bin/sh

mysqld_safe &

sleep 5

mariadb -u root<<EOF
CREATE DATABASE WP_db;
CREATE USER 'ST'@'localhost' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON WP_db.* TO 'ST'@'localhost';
FLUSH PRIVILEGES;
EOF

sleep 4000000