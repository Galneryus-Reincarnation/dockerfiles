FROM alpine:3.5

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

CMD ["/usr/bin/php-fpm"]
