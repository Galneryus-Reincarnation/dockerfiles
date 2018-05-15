FROM alpine:3.7

RUN     mkdir /work
WORKDIR /work

ENV     JVMBASE /usr/jvm
RUN     curl -OL https://cdn.azul.com/zulu/bin/zulu10.1+11-jdk10-linux_x64.tar.gz
RUN     tar zxvf zulu*
RUN     rm *.tar.gz
RUN     mv zulu*/ $JVMBASE




ENV JAVA_HOME /usr/jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin
