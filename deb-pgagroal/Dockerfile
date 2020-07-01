FROM    ubuntu:18.04 as BUILD

RUN     mkdir /tmp/src /tmp/pkg
WORKDIR /tmp/src

ENV     VER "0.7.2"

RUN     apt update && apt upgrade -y && \
        apt install wget libev4 libev-dev libssl1.1 libssl-dev systemd libsystemd-dev python-docutils gcc-8 cmake -y

RUN     update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 \
        update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-8 60

RUN     cd /tmp/src && \
        wget https://github.com/agroal/pgagroal/releases/download/$VER/pgagroal-$VER.tar.gz && \
        tar zxf pgagroal-$VER.tar.gz && \
        cd pgagroal-$VER && \
        mkdir build && cd build && \
        cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .. && \
        make -j4 && \
        make DESTDIR=/tmp/pkg install && \
        find /tmp/pkg


FROM    ruby:2.5 as PACKAGE
RUN     mkdir /tmp/pkg /tmp/dist
WORKDIR /tmp

COPY    --from=BUILD /tmp/pkg /tmp/pkg

ENV     VER "0.7.2"

RUN     true && \
        gem install fpm && \
        fpm -s dir -t deb -C pkg/ \
        -p dist/pgagroal-"$VER".deb \
        -n pgagroal \
        -v "$VER" \
        -d libev4 \
        -d libssl1.1 \
        --config-files /etc/pgagroal/pgagroal.conf \
        --config-files /etc/pgagroal/pgagroal_hba.conf
