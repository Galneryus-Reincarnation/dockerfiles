FROM    tnairav/ubuntu-build:latest as BUILD

RUN     mkdir /tmp/src /tmp/pkg
WORKDIR /tmp/src

ENV     VER "0.7.0"

RUN     true && \
            wget https://github.com/concurrencykit/ck/archive/$VER.tar.gz && \
            tar zxf $VER.tar.gz && \
            cd ck-*/ && \
            ./configure --prefix=/usr && \
            make -j1 && \
            make DESTDIR="/tmp/pkg" install && \
            find /tmp/pkg


FROM    ruby:2.5 as PACKAGE
RUN     mkdir /tmp/pkg /tmp/dist
WORKDIR /tmp

COPY    --from=BUILD /tmp/pkg /tmp/pkg

ENV     VER "0.7.0"
RUN     true &&\
            gem install fpm && \
            fpm -s dir -t deb -C pkg/ -p dist/ck-"$VER".deb -n ck -v "$VER"
