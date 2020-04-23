FROM tnairav/ubuntu-build:latest

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

