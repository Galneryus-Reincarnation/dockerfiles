FROM    tnairav/ubuntu-build:latest as BUILD

RUN     mkdir /tmp/src /tmp/pkg
WORKDIR /tmp/src

ENV     VER "0.4.0"

RUN     true && \
            wget wget https://downloads.sourceforge.net/ta-lib/ta-lib-$VER-src.tar.gz && \
            tar zxvf ta-lib-$VER-src.tar.gz && \
            cd ta-lib && \
            ./configure --prefix=/usr && \
            make -j1 && \
            make DESTDIR="/tmp/pkg" install



FROM    ruby:2.5 as PACKAGE
RUN     mkdir /tmp/pkg /tmp/dist
WORKDIR /tmp

COPY    --from=BUILD /tmp/pkg /tmp/pkg

ENV     VER "0.4.0"
RUN     true &&\
            gem install fpm && \
            fpm -s dir -t deb -C pkg/ -p dist/ta-lib-"$VER".deb -n ta-lib -v "$VER"

