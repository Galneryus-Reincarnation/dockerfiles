#!/bin/sh

set -x

cd /opt/dist

apk update
apk add --update \
tzdata \
php5-apcu \
php5-bcmath \
php5-bz2 \
php5-cli \
php5-common \
php5-ctype \
php5-curl \
php5-dom \
php5-exif \
php5-fpm \
php5-ftp \
php5-gd \
php5-gettext \
php5-gmp \
php5-iconv \
php5-imagick \
php5-imap \
php5-json \
php5-ldap \
php5-mcrypt \
php5-memcache \
php5-mssql \
php5-mysql \
php5-mysqli \
php5-odbc \
php5-opcache \
php5-openssl \
php5-pdo \
php5-pdo_dblib \
php5-pdo_mysql \
php5-pdo_odbc \
php5-pdo_pgsql \
php5-pdo_sqlite \
php5-pgsql \
php5-soap \
php5-sockets \
php5-sqlite3 \
php5-xcache \
php5-xml \
php5-xmlreader \
php5-xmlrpc \
php5-zip \
php5-zlib


rm -rf /opt/dist
rm -rf /var/cache/apk/*

