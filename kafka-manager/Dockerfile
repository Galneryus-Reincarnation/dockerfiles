FROM galneryus/alpine-jdk:latest

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

ENTRYPOINT  "/opt/kafka-manager/bin/kafka-manager"
