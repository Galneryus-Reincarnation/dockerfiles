FROM tnairav/ubuntu-build:latest

RUN  add-apt-repository --yes ppa:deadsnakes/ppa
RUN  apt update && apt upgrade --yes && apt install --yes python3.7-dev libpython3.7-dev python3.7-venv

RUn     rm -f /usr/bin/python /usr/bin/python3
RUN     ln -sv /usr/bin/python3.7 /usr/bin/python
RUN     ln -sv /usr/bin/python3.7 /usr/bin/python3
RUN     cd /tmp && \
            wget https://web.us-east-1.linodeobjects.com/public/files/deb/ck-0.7.0-1.deb && \
            wget https://web.us-east-1.linodeobjects.com/public/files/deb/jlog-2.4.0-2.deb && \
            apt install --yes ./*.deb && \
            rm *.deb

RUN     mkdir /var/www && chown www-data:www-data /var/www
USER    www-data
ENV     HOME /var/www

