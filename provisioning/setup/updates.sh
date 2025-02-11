#!/bin/sh

# ---------------------------------------------------------------------------------
# Updates
#
# - upgrade manually from firefly 3.x to 3.2 without breaking your Databases
# - just keep it as it is or customize it to your needs and then run:
# - vagrant reload --provision
#
# Updating all PHP versions:
# - if you have been upgrading your box with sudo apt-get upgrade you uncomment all php versions for auto update
# - otherwise you should update using vagrant ssh and then sudo apt-get update && sudo apt-get upgrade
#
# ---------------------------------------------------------------------------------

# update outdated mysql dpkg -> if key expired error occurs
# you should execute these commands manually
# wget https://repo.mysql.com/mysql-apt-config_0.8.22-1_all.deb
# sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb

# Update everything
sudo apt-get update
sudo apt-get upgrade -Y

# php 8.4
apt install -y php8.4 php8.4-{fpm,cli,redis,mcrypt,mbstring,soap,intl,zip,xml,gd,opcache,apcu,mysql,curl,bcmath,imagick,imap,memcached,xdebug,imagick,igbinary,msgpack,common,sqlite3}


# PHP 8.1
sudo apt-get install -y php8.1 php8.1-fpm php8.1-cli php8.1-redis php8.1-mcrypt php8.1-mbstring php8.1-soap php8.1-intl php8.1-zip php8.1-xml php8.1-gd php8.1-opcache php8.1-apcu php8.1-mysql php8.1-curl php8.1-bcmath php8.1-imagick php8.1-imap

# PHP 8.0
sudo apt-get install -y php8.0 php8.0-fpm php8.0-cli php8.0-redis php8.0-mcrypt php8.0-mbstring php8.0-soap php8.0-intl php8.0-zip php8.0-xml php8.0-gd php8.0-opcache php8.0-apcu php8.0-mysql php8.0-curl php8.0-bcmath php8.0-imagick php8.0-imap

# PHP 7.4
# sudo apt-get install -y php7.4 php7.4-fpm php7.4-cli php7.4-redis php7.4-mcrypt php7.4-mbstring php7.4-soap php7.4-intl php7.4-zip php7.4-xml php7.4-gd php7.4-opcache php7.4-apcu php7.4-mysql php7.4-curl php7.4-bcmath php7.4-imagick php7.4-json

# PHP 7.3
# sudo apt-get install -y php7.3 php7.3-fpm php7.3-cli php7.3-redis php7.3-mcrypt php7.3-mbstring php7.3-soap php7.3-intl php7.3-zip php7.3-xml php7.3-gd php7.3-opcache php7.3-apcu php7.3-mysql php7.3-curl php7.3-bcmath php7.3-imagick php7.3-json

# PHP 7.2
# sudo apt-get install -y php7.2 php7.2-fpm php7.2-cli php7.2-redis php7.2-mcrypt php7.2-mbstring php7.2-soap php7.2-intl php7.2-zip php7.2-xml php7.2-gd php7.2-opcache php7.2-apcu php7.2-mysql php7.2-curl php7.2-bcmath php7.2-imagick php7.2-json

# PHP 7.1
# sudo apt-get install -y php7.1 php7.1-fpm php7.1-cli php7.1-redis php7.1-mcrypt php7.1-mbstring php7.1-soap php7.1-intl php7.1-zip php7.1-xml php7.1-gd php7.1-opcache php7.1-apcu php7.1-mysql php7.1-curl php7.1-bcmath php7.1-imagick php7.1-json

# PHP 7.0
# sudo apt-get install -y php7.0 php7.0-fpm php7.0-cli php7.0-redis php7.0-mcrypt php7.0-mbstring php7.0-soap php7.0-intl php7.0-zip php7.0-xml php7.0-gd php7.0-opcache php7.0-apcu php7.0-mysql php7.0-curl php7.0-bcmath php7.0-imagick php7.0-json

# PHP 5.6
# sudo apt-get install -y php5.6 php5.6-fpm php5.6-cli php5.6-redis php5.6-mcrypt php5.6-mbstring php5.6-soap php5.6-intl php5.6-zip php5.6-xml php5.6-gd php5.6-opcache php5.6-apcu php5.6-mysql php5.6-curl php5.6-bcmath php5.6-imagick php5.6-json

# Composer 2.x update
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"

# reload apache
sudo service apache2 restart
