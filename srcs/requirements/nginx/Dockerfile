FROM debian:bullseye

RUN apt-get update 

RUN apt install -y nginx && apt install openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/NG.crt -keyout /etc/nginx/ssl/NG.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=idabligi.42.fr/UID=idabligi"

COPY conf/nginx.cnf /etc/nginx/

CMD ["sleep", "4000000"]