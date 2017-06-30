FROM base/archlinux

ADD  dist /opt/dist
RUN  sh /opt/dist/install.sh

#USER root
#ENV HOME /root
ENV JAVA_HOME          /usr/lib/jvm/java-8-jdk
ENV FLAMEGRAPH_DIR     /opt/FlameGraph-master
