FROM    tnairav/ubuntu-build-non-root:latest as BUILD

RUN     mkdir /tmp/src /tmp/dist
WORKDIR /tmp/src

ENV     VER_GHC         "8.10.1"
ENV     VER_GQLSERVER   "v1.2.2"

RUN     true && \
        export PATH=~/.cabal/bin:~/.ghcup/bin:$PATH && \
        ghcup install $VER_GHC && ghcup set $VER_GHC && ghcup install-cabal && \
        git clone https://github.com/hasura/graphql-engine.git && \
        cd graphql-engine/server && \
        git checkout -b build $VER_GQLSERVER && \
        cabal v2-update && \
        cabal v2-build && \
        cp `find dist-newstyle/ -name graphql-engine -type f` . && \
        strip graphql-engine && \
        cp graphql-engine /tmp/dist/

