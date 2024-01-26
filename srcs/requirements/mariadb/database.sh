#!bin/sh

mysqld_safe &

sleep 5

mariadb -u root<<EOF
CREATE DATABASE WP_db;
CREATE USER 'ST'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'ST'@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin shutdown

mysqld_safe


#The lines between <<EOF and EOF are executed as commands 
# within the MariaDB shell.