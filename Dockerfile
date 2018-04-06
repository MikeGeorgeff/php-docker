FROM phusion/baseimage:latest

MAINTAINER Mike Georgeff <mike.georgeff@uscca.com>

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get install -y software-properties-common && add-apt-repository -y ppa:ondrej/php

RUN apt-get update

RUN apt-get install -y pkg-config \
					   libcurl4-openssl-dev\
					   libedit-dev \
					   libssl-dev \
					   libxml2-dev \
					   xz-utils \
					   libsqlite3-dev \
					   sqlite3 \
					   git \
					   curl \
					   vim \
					   nano \
					   libmcrypt4 \
					   mcrypt

RUN apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
					   php7.2-cli \
					   php7.2-common \
					   php7.2-curl \
					   php7.2-intl \
					   php7.2-json \
					   php7.2-xml \
					   php7.2-mbstring \
					   php7.2-mysql \
					   php7.2-sqlite \
					   php7.2-sqlite3 \
					   php7.2-zip \
					   php7.2-bcmath \
					   php7.2-memcached \
					   php7.2-gd \
					   php7.2-dev \
					   php7.2-soap \
					   php7.2-imap \
					   php7.2-readline \
					   php-redis

RUN apt-get clean


RUN sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/cli/php.ini
RUN sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/cli/php.ini
RUN sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/7.2/cli/php.ini
RUN sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/7.2/cli/php.ini


RUN curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer