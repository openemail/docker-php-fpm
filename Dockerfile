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
      php \
      php-cli \
      php-apcu \
      php-amqp \
      php-bcmath \
      php-bz2 \
      php-calendar \
      php-ctype \
      php-curl \
      php-dba \
      php-dom \
      php-embed \
      php-enchant \
      php-exif \
      php-fileinfo \
      php-fpm \
      php-ftp \
      php-gd \
      php-gettext \
      php-gmp \
      php-iconv \
      php-imagick \
      php-imap \
      php-intl \
      php-json \
      php-ldap \
      php-mailparse \
      php-mbstring \
      php-mcrypt \
      php-memcached \
      php-mysqli \
      php-mysqlnd \
      php-odbc \
      php-opcache \
      php-openssl \
      php-pcntl \
      php-pdo \
      php-pdo_mysql \
      php-pdo_pgsql \
      php-pdo_sqlite \
      php-pgsql \
      php-phar\
      php-posix \
      php-pspell \
      php-recode \
      php-redis \
      php-session \
      php-shmop \
      php-simplexml \
      php-snmp \
      php-soap \
      php-sockets \
      php-sqlite3 \
      php-tidy \
      php-tokenizer \
      php-wddx \
      php-xdebug \
      php-xml \
      php-xmlreader \
      php-xmlrpc \
      php-xmlwriter \
      php-xml \
      php-zip \
      php-zlib \
      php-zmq \
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
