FROM alpine:3.4

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

CMD ["mysqld", "--skip-grant-tables"]
