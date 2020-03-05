FROM    ruby:2.5 as PACKAGE
RUN     mkdir -p /tmp/dist /tmp/src /tmp/pkg /tmp/pkg/usr/bin /tmp/pkg/lib/systemd/system


ENV     VER "0.6.2"

WORKDIR /tmp/src
RUN     true &&\
            wget https://github.com/pomerium/pomerium/releases/download/v$VER/pomerium-linux-amd64 && \
            mv pomerium-linux-amd64 pomerium && \
            chmod +x pomerium && \
            mv pomerium /tmp/pkg/usr/bin
COPY    pomerium.service /tmp/pkg/lib/systemd/system/
RUN     find /tmp/pkg

WORKDIR /tmp
RUN     true && \
            gem install fpm && \
            fpm -s dir -t deb -C pkg/ -p dist/pomerium-"$VER".deb -n ta-lib -v "$VER" 
