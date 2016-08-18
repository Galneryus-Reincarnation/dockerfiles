FROM alpine:3.4

ADD  .git/HEAD /CACHE_BUSTER
RUN  rm /CACHE_BUSTER
ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

