
cd /tmp

export PATH=~/.cabal/bin:~/.ghcup/bin:$PATH
echo $PATH
ghcup install 8.10.1
ghcup set 8.10.1
ghcup install-cabal
git clone https://github.com/hasura/graphql-engine.git
cd graphql-engine/server
git checkout -b build v1.3.0
cp cabal.project.ci cabal.project.local
cabal v2-update
cabal v2-build -j
cp `find dist-newstyle/ -name graphql-engine -type f` .
strip graphql-engine
