#!/bin/sh

mkdir /home/vagrant/bin 2>/dev/null

cd /home/vagrant/bin && \
  wget https://getcomposer.org/installer && \
  php installer -- --install-dir=/home/vagrant/bin --filename=composer && \
  chmod 755 composer

rm installer 2>/dev/null

# ./composer global require "fxp/composer-asset-plugin:~1.1.0"
