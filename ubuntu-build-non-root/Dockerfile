FROM tnairav/ubuntu-build:latest


RUN  apt update && apt install --yes software-properties-common apt-utils
RUN  add-apt-repository --yes ppa:deadsnakes/ppa
RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E0C56BD4

RUN  apt update && apt upgrade --yes && apt install --yes \
         python3.7-dev libpython3.7-dev virtualenv python3.7-venv

RUN     cd /tmp && \
            wget https://web.us-east-1.linodeobjects.com/public/files/deb/ck-0.7.0-1.deb && \
            wget https://web.us-east-1.linodeobjects.com/public/files/deb/jlog-2.4.0-2.deb && \
            apt install --yes ./*.deb && \
            rm *.deb

RUN     mkdir /var/www && chown www-data:www-data /var/www
USER    www-data
ENV     HOME /var/www

