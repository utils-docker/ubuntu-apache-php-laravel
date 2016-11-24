FROM teste

MAINTAINER Fábio Luciano <fabioluciano@php.net>

ENV COMPOSER_HOME /usr/share/composer/

COPY files/cert/* /etc/apache2/ssl/

RUN git config --global http.sslVerify false

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
  && /usr/local/bin/composer global require hirak/prestissimo \
  && rm -rf $COMPOSER_HOME/cache/*

COPY files/vhost/* /etc/nginx/sites-enabled/

VOLUME ["/var/www/application"]
