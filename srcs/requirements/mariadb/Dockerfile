FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY database.sh /root/script/

RUN chmod +x /root/script/database.sh

CMD ["./root/script/database.sh"]