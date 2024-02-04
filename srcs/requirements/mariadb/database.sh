#!bin/sh

mysqld_safe &

sleep 5

mariadb -u root <<EOF
CREATE DATABASE WP_DB;
CREATE USER 'WP'@'%' IDENTIFIED BY '123';
GRANT ALL PRIVILEGES ON *.* TO 'WP'@'%';
FLUSH PRIVILEGES;
EOF

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '911';"

mysqladmin -u root -p911 shutdown

mysqld_safe

#The lines between <<EOF and EOF are executed as commands 
# within the MariaDB shell.