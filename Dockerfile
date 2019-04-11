FROM tiredofit/alpine:3.9
LABEL maintainer="Chinthaka Deshapriya (chinthaka@cybergate.lk)"

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub


### Default Runtime Environment Variables
ENV ZABBIX_HOSTNAME=php-fpm \
    ENABLE_SMTP=TRUE


### Dependency Installation
RUN set -x && \
    echo 'https://dl.bintray.com/php-alpine/v3.9/php-7.3/' >> /etc/apk/repositories && \
    apk update && \
      apk add \
      apache2-utils \
      ca-certificates \
      mariadb-client \
      openssl \
      php7-apcu \
      php7-amqp \
      php7-bcmath \
      php7-bz2 \
      php7-calendar \
      php7-ctype \
      php7-curl \
      php7-dba \
      php7-dom \
      php7-embed \
      php7-enchant \
      php7-exif \
      php7-fileinfo \
      php7-fpm \
      php7-ftp \
      php7-gd \
      php7-gettext \
      php7-gmp \
      php7-iconv \
      php7-imagick \
      php7-imap \
      php7-intl \
      php7-json \
      php7-ldap \
      php7-mailparse \
      php7-mbstring \
      php7-mcrypt \
      php7-memcached \
      php7-mysqli \
      php7-mysqlnd \
      php7-odbc \
      php7-opcache \
      php7-openssl \
      php7-pcntl \
      php7-pdo \
      php7-pdo_mysql \
      php7-pdo_pgsql \
      php7-pdo_sqlite \
      php7-pgsql \
      php7-phar\
      php7-posix \
      php7-pspell \
      php7-recode \
      php7-redis \
      php7-session \
      php7-shmop \
      php7-simplexml \
      php7-snmp \
      php7-soap \
      php7-sockets \
      php7-sqlite3 \
      php7-tidy \
      php7-tokenizer \
      php7-wddx \
      php7-xdebug \
      php7-xml \
      php7-xmlreader \
      php7-xmlrpc \
      php7-xmlwriter \
      php7-xml \
      php7-zip \
      php7-zlib \
      php7-zmq \
      && \
      \
      rm -rf /var/cache/apk/* && \

###  PHP7 Setup
      addgroup -g 102 www-data && \
      adduser  -S -h  /www -G www-data -u 102 www-data && \   
      #sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php7/php.ini && \
      ln -s /usr/sbin/php-fpm7 /sbin/php-fpm && \
      \
### Install PHP Composer
      curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
      \
### WWW  Installation
      mkdir -p /www/logs
      
### Networking Configuration

### Files Addition
ADD install /
