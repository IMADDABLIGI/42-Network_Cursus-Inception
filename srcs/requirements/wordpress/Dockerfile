FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php libapache2-mod-php && apt install -y php-mysql

RUN apt install -y mariadb-client

COPY wp.sh /copy/

RUN chmod +x /copy/wp.sh

CMD ["./copy/wp.sh"]


#docker system prune -a

