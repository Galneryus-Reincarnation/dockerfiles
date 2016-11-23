FROM galneryus/alpine-jdk:latest

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

ENV L5D_HOME /opt/linkerd
