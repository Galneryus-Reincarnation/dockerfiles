FROM alpine:3.3

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

ENTRYPOINT ["mysqld"]
CMD ["--skip-grant-tables"]
