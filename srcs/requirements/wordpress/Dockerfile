FROM debian:11.8

RUN apt update -y && apt upgrade -y && apt install -y curl \
	curl php7.4  php-fpm   php-mysql   mariadb-client -y

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wp.sh /usr/local/bin/wordpress.sh
RUN chmod +x /usr/local/bin/wordpress.sh

CMD ["./usr/local/bin/wordpress.sh"]
