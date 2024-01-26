FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php libapache2-mod-php && apt install -y php-mysql

RUN apt install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir wp && cd wp && wp core download --allow-root

RUN cd wp && mv wp-config-sample.php wp-config.php

RUN cd wp && wp config set SERVER_PORT 3306 --allow-root

# RUN cd wp && wp config --dbhost=localhost --dbname=WP_db --dbuser=ST --dbpass=123 --allow-root

COPY wp.sh /copy/

RUN chmod +x /copy/wp.sh

CMD ["./copy/wp.sh"]


#docker system prune -a

#wp core install --url=idabligi.42.fr --title=TEST --admin_user=king --admin_password=kingpass --admin_email=info@example.com --allow-root --path=/wp