FROM php:7.0.23-apache

RUN apt-get update && apt-get install -y \
        cron \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxml2-dev \
        libxslt1-dev \
        libicu-dev \
        mysql-client \
        xmlstarlet \
    && docker-php-ext-install -j$(nproc) bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) json \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-install -j$(nproc) mcrypt \
    && docker-php-ext-install -j$(nproc) mbstring \
    && docker-php-ext-install -j$(nproc) pcntl \
    && docker-php-ext-install -j$(nproc) soap \
    && docker-php-ext-install -j$(nproc) xsl \
    && docker-php-ext-install -j$(nproc) zip \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-install -j$(nproc) pdo \
    && docker-php-ext-install -j$(nproc) pdo_mysql \
    && pecl install redis-3.1.0 \
    && docker-php-ext-enable redis \
    && a2enmod rewrite headers \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin/ --filename=composer \
    && php -r "unlink('composer-setup.php');"

ENV MYSQL_HOSTNAME="mysql" MYSQL_USERNAME="root" MYSQL_PASSWORD="secure" MYSQL_DATABASE="magento" CRYPT_KEY="" \
    URI="http://localhost" ADMIN_USERNAME="admin" ADMIN_PASSWORD="adm1nistrator" ADMIN_FIRSTNAME="admin" \
    ADMIN_LASTNAME="admin" ADMIN_EMAIL="admin@localhost.com" CURRENCY="EUR" LANGUAGE="en_US" \
    TIMEZONE="Europe/Amsterdam" BACKEND_FRONTNAME="admin" CONTENT_LANGUAGES="en_US"

