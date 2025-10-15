#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html
if [ ! -f /usr/local/bin/wp ]; then
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
fi
if [ ! -f wp-load.php ]; then
  wp core download --allow-root
fi
sleep 10
if [ ! -f wp-config.php ]; then
  wp config create \
    --dbname="${MYSQL_DATABASE}" \
    --dbuser="${MYSQL_USER}" \
    --dbpass="${MYSQL_PASSWORD}" \
    --dbhost="${DB_HOST}" \
    --allow-root
fi
wp core install \
  --url="${DOMAIN_NAME}" \
  --title="${SITE_TITLE}" \
  --admin_user="${WP_ADMIN_USER}" \
  --admin_password="${WP_ADMIN_PASSWORD}" \
  --admin_email="${WP_ADMIN_EMAIL}" \
  --skip-email \
  --allow-root
wp user create \
  "${WP_USER}" "${WP_USER_EMAIL}" \
  --user_pass="${WP_USER_PASSWORD}" \
  --role=editor \
  --allow-root
mkdir -p /run/php
php-fpm7.4 -F
