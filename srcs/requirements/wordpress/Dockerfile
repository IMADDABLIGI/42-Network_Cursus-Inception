FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php php-mysql php-fpm mariadb-client sed

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wp.sh /copy/

RUN chmod +x /copy/wp.sh

CMD ["./copy/wp.sh"]
