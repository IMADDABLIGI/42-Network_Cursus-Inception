#!/bin/sh

openssl req -x509 -nodes -out ${CERTS_PATH} -keyout /etc/nginx/ssl/NG.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=idabligi.42.fr/UID=idabligi"

echo "server {
            listen  443 ssl;
            ssl_protocols TLSv1.3;
            ssl_certificate ${CERTS_PATH};
            ssl_certificate_key /etc/nginx/ssl/NG.key;
            
            #root and index and server_name
            root /var/www/html;
            server_name ${DOMAIN_NAME};
            index index.php index.html index.htm;
            
            location ~ \.php$ {								# For every php request
                include snippets/fastcgi-php.conf;
                fastcgi_pass wordpress:9000;
            }
        }
        " >> etc/nginx/sites-available/default

nginx -g "daemon off;"