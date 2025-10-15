FROM debian:11.8

RUN apt update -y && apt upgrade -y && apt install nginx -y

COPY tools/index.html /var/www/html/index.html
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
