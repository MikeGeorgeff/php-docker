FROM phusion/baseimage:latest

MAINTAINER Mike Georgeff <mike.georgeff@uscca.com>

RUN DEBIAN_FRONTEND=noninteractive
RUN locale-gen en_US.UTF-8

ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LC_CTYPE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV TERM xterm

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
					   nano 

RUN apt-get install -y php7.2-cli \
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
					   php7.2-dev

RUN apt-get clean

RUN curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer