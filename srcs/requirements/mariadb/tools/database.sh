#!bin/sh

mysqld_safe &

sleep 3

mariadb -u root <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER $MARIA_DB_USER@'%' IDENTIFIED BY '$MARIA_DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO $MARIA_DB_USER@'%';
FLUSH PRIVILEGES;
EOF

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIA_DB_ROOT_PASSWORD';"

mysqladmin -u root -p$MARIA_DB_ROOT_PASSWORD shutdown

mysqld_safe