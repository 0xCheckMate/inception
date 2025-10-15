FROM debian:11.8

RUN apt-get update && apt-get install -y \
    php-cli php-curl php-mysql curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www/html \
    && curl -L -o /var/www/html/index.php https://www.adminer.org/latest.php

WORKDIR /var/www/html

CMD ["php", "-S", "0.0.0.0:8080"]