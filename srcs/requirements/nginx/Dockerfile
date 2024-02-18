FROM debian:bullseye

RUN apt-get update 

RUN apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl

COPY tools/ng.sh /copy/

RUN chmod +x /copy/ng.sh

CMD ["./copy/ng.sh"]
