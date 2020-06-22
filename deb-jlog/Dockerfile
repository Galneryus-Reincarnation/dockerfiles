FROM    tnairav/ubuntu-build:latest as BUILD

RUN     mkdir /tmp/src /tmp/pkg
WORKDIR /tmp/src

ENV     VER "2.5.2"

RUN     true && \
            apt update && apt install autoconf -y && \
            wget https://web.us-east-1.linodeobjects.com/public/files/deb/ck-0.7.0-1.deb && \
            apt install --yes ./ck-*.deb && \
            wget https://github.com/omniti-labs/jlog/archive/$VER.tar.gz && \
            tar zxf $VER.tar.gz && \
            cd jlog-$VER && \
            sed -i 's#define DEFAULT_UNIT_LIMIT [(]4#define DEFAULT_UNIT_LIMIT (512#' jlog_private.h && \
            autoconf && \
            ./configure --prefix=/usr && \
            make -j1 && \
            make DESTDIR="/tmp/pkg" install


FROM    ruby:2.5 as PACKAGE
RUN     mkdir /tmp/pkg /tmp/dist
WORKDIR /tmp

COPY    --from=BUILD /tmp/pkg /tmp/pkg

ENV     VER "2.4.0"
ENV     REV "2"

RUN     true &&\
            gem install fpm && \
            fpm -s dir -t deb -C pkg/ -p dist/jlog-"$VER-$REV".deb -n jlog -v "$VER-$REV"
