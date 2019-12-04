FROM archlinux:latest

WORKDIR /tmp
RUN pacman -Syu --noconfirm wget base-devel git stack cabal-install happy
# RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/auracle-git.tar.gz
#RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/aura-git.tar.gz

RUN wget https://aur.archlinux.org/cgit/aur.git/snapshot/haskell-ide-engine.tar.gz
RUN bsdtar xf haskell-ide-engine.tar.gz
RUN mkdir /.stack && chown nobody /.stack
RUN chown nobody haskell-ide-engine && \
    pushd haskell-ide-engine && \
    sudo -u nobody makepkg && \
    popd
