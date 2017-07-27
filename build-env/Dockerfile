FROM base/archlinux

USER root
ENV HOME                /root
ENV JAVA_HOME          /usr/lib/jvm/java-8-jdk
ENV FLAMEGRAPH_DIR     /opt/FlameGraph-master

ADD  dist /opt/dist
RUN  bash /opt/dist/install

