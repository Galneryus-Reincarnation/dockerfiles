FROM centos:7

USER root
ENV HOME                /root
ENV JAVA_HOME           /usr/java/default
ENV FLAMEGRAPH_DIR      /opt/FlameGraph-master
ENV PATH                $PATH:/usr/local/couchbase/bin

ADD  dist /opt/dist
RUN  bash /opt/dist/install

