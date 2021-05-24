FROM php:7.4-cli

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN chmod +x composer.phar && mv composer.phar /usr/local/bin/composer
RUN php -r "unlink('composer-setup.php');"

COPY . /app
WORKDIR /app
