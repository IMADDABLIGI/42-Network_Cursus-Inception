FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php libapache2-mod-php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

CMD ["sleep", "1000000"]