FROM alpine:3.4

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

ENTRYPOINT ["/usr/bin/php-fpm"]

