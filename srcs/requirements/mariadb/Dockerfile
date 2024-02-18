FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

COPY tools/database.sh /root/script/

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /root/script/database.sh

CMD ["./root/script/database.sh"]