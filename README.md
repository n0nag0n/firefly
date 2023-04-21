# firefly 1.0.1: web developer box with multiple PHP versions
vagrant box for PHP Developers with IonCube Integration for professional web development. Works with Shopware and many other applications and frameworks such as Magento, Oxid 6.x, Wordpress, Typo3 or Laravel.

### Forked from JarJarBernie/jimmybox
Added PHP8.2 and changed to MariaDB 10.5, added Adminer and beanstalkd. Also add in Redis and memcached services.

## Quick Setup Option 1:
1. Get the latest Versions of Vagrant and Virtual Box

1. clone the latest version and run vagrant up
	```bash
	git clone https://github.com/n0nag0n/firefly.git .
	cd firefly/
	vagrant up
	```
1. open **192.168.56.11** in your browser (default PHP Version is 8.2) or if you've configured your `/etc/hosts` file (see below) then you can navigate to **http://firefly82.com/** and you'll be all set!
   - (IP can be changed in your Vagrantfile, the "public" directory is your document root)
1. You can put any project inside the `public/` directory and it will work as a "subfolder". For instance, if you have a Wordpress project in a folder named `amazing-blog/`, put that directory in `public/` and then navigate to `http://firefly82.com/amazing-blog/` and you'll see your project there!
   - If you want to navigate to your own custom domain so it is on it's own domain such as `http://myproject.com/`, see the section on "Provisioning & custom hosts setup"

## Quick Setup Option 2:
You can also install this quickly, but have a more limited ability to customize this (easily). 

You can simply run `vagrant init n0nag0n/firefly` and it will install this VM locally. With that, you don't have access to any of the fireflyXX.com domains and you will be defaulted to use PHP 8.2. If you do this, in your new Vagrant file, you likely will have to do something similar to the following:

```ruby

# Change it to your correct document root for your project.
config.vm.provision "shell", inline: <<-SHELL
  sed -i 's#DocumentRoot /var/www/$#DocumentRoot /var/www/public/#g' /etc/apache2/sites-available/000-default.conf
SHELL
```

## Made for PHP professionals and E-Commerce developers
### Laravel 8 ready
- tested with Laravel 8

### Oxid 6 ready
- tested with Oxid 6.4 (PHP 7.4 - 8.1)
- tested with Oxid 6.3 (PHP 7.4 - 8.0)
- tested with Oxid 6.2 (PHP 7.1 - 7.4)
- tested with Oxid 6.1 (PHP 7.0 - 7.2)
- tested with Oxid PE 4.10 CE / PE (PHP 5.6)
- tested with Oxid Enterprise 5.10 (PHP 5.6)

### Shopware ready´
- tested with Shopware 5.6
- comes with **APCu & IonCube Loader for all PHP < 8.0**
- including Zend Guard Loader for PHP 5.6

### Wordpress ready
- tested with Wordpress 5.7

## Features
- Ubuntu 20.04 LTS
- VirtualBox Guest Additions
- Apache 2.4 with HTTP/2
- PHP 5.6-8.2 FPM
   - Composer (2.5.4)
      - Note: If you want to install a composer package against a specific php version, you can type something such as `php7.4 /usr/bin/composer require package/name`
   - Enabled Extensions: xdebug, gd, igbinary, imagick, mcrypt, memcached, bcmath, xml/dom, simplexml, json, mysqlnd/pdo, opcache, intl, mbstring, redis, apcu.
   - IonCube Loader
   - Zend Guard Loader (PHP 5.6)
- MariaDB (10.5.19)
- SQLite 3 (3.31.1)
- Adminer (4.8.1)
- Redis Server (5.0.7)
- Memcached (1.5.22)
- beanstalkd (with beanstalkd-cli available as well as at [http://firefly82.com/beanstalkd/](http://firefly82.com/beanstalkd/))
- Vim (8.1)
- Git (2.25.1)
- Mercurial (5.3.1)
- cURL (7.68.0)
- increased disk size (128GB)

## MySQL/MariaDB Access

- Hostname: localhost or 127.0.0.1
- Username: root
- Password: root
- Navigate to [http://firefly82.com/adminer.php](http://firefly82.com/adminer.php) to use [Adminer](https://adminer.org) to have a UI to your databases.

## Switching PHP-Versions:

firefly comes with preconfigured virtual hosts to use multiple PHP Versions from 5.6 to 8.2. Please just edit your local hosts file (usually at `/etc/hosts`) to use different PHP Versions.

#### Prepare your hosts file

```bash

# PHP 8.2
192.168.56.11  firefly82.com

# PHP 8.1
192.168.56.11  firefly81.com

# PHP 8.0
192.168.56.11  firefly80.com

# PHP 7.4
192.168.56.11  firefly74.com

# PHP 7.3
192.168.56.11  firefly73.com

# PHP 7.2
192.168.56.11  firefly72.com

# PHP 7.1
192.168.56.11  firefly71.com

# PHP 7.0
192.168.56.11  firefly70.com

# PHP 5.6
192.168.56.11  firefly56.com
```

#### open firefly in your browser
- PHP 8.2: http://firefly82.com
- PHP 8.1: http://firefly81.com
- PHP 8.0: http://firefly80.com
- PHP 7.4: http://firefly74.com
- PHP 7.3: http://firefly73.com
- PHP 7.2: http://firefly72.com
- PHP 7.1: http://firefly71.com
- PHP 7.0: http://firefly70.com
- PHP 5.6: http://firefly56.com

## Provisioning & custom hosts setup
You can use our provisioning template to setup your custom hosts.

1. place your `hosts.conf` files in `provisioning/hosts/` and edit them regarding to your needs
2. open `provisioning/setup/apache.sh` and add code to enable/disable your custom hosts. This will ensure that your hosts only will be enabled if the directory exists.
3. if needed, copy your SSL certs to `provisioning/ssl/` and link it in your custom hosts config file
4. restart vagrant with the provisioning flag and your vhosts will get enabled if the vhosts dir exists.

````nashorn js
vagrant reload --provision
````

### Switching PHP Versions in your custom hosts

Please include the following SetHandler directives in your custom vhost as seen in provisioning/hosts/100-myproject.conf.
After that, you can simply uncomment the requested line and reload your apache config (sudo service apache2 reload)

```
<FilesMatch \.php>
	SetHandler "proxy:unix:/var/run/php/php8.2-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php8.1-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php8.0-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php7.4-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php7.3-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php7.2-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php7.1-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php7.0-fpm.sock|fcgi://localhost/"
	# SetHandler "proxy:unix:/var/run/php/php5.6-fpm.sock|fcgi://localhost/"
</FilesMatch>
```

### Modify php.ini settings

Since firefly 1.0.0 you can manage the php.ini settings from within the provisioning folder:

- modify the `php.ini` files for php-fpm / php-cli in `provisioning/php.ini/{php-version}/fpm/php.ini`
- after this perform a vagrant reload --provision

````nashorn js
vagrant reload --provision
````

-----

# Upgrade

Nothing to upgrade so far!
<!-- ### Upgrade from 3.x to 3.2
if you don't want to use ***vagrant box upgrade*** you can run ***vagrant reload --provision*** instead.
This will run the commands in provisioning/setup/updates.sh and install the newest versions of
- PHP 5.6 - PHP 8.2
- Composer

````bash
# uncomment this line in your Vagrantfile:
config.vm.provision "shell", path: "./provisioning/setup/updates.sh"
````

```bash
# prepare (firefly must me running)
vagrant ssh
wget https://repo.mysql.com/mysql-apt-config_0.8.22-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb
sudo apt-get update
sudo apt-get upgrade

# if firefly is running
vagrant reload --provision

# if firefly is not running
vagrant up --provision
```

### Upgrade from older version
Please do not use vagrant box update if you are using firefly < 3.0! Create a new version instead an migrate your data manually. -->

------

# Known issues & fixes

## MacOS Monterey Fixes (network and NFS share)

After upgrading to MacOS 12.x Vagrant stops working due to an issue with Virtual Box (6.1.30). Until the issue is fixed, please use the following workaround:

- add the following line to /etc/vbox/networks.conf (file does not exist by default and has to be created)

```
* 0.0.0.0/0 ::/0
```

Vagrant will also throw an error during startup concerning the NFS Share (nfs folders uninitialized constant error).
You can fix this regarding to https://github.com/hashicorp/vagrant/issues/12583

```
sudo curl -o /opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/plugins/hosts/darwin/cap/path.rb \ 
 https://raw.githubusercontent.com/hashicorp/vagrant/42db2569e32a69e604634462b633bb14ca20709a/plugins/hosts/darwin/cap/path.rb 
```

## NFS Share in MacOS 10.15 (Catalina) / MacOS 11 (Big Sur) / MacOS 12 (Monterey)
In Catalina (and sometimes Big Sur) NFS seems to have troubles finding a relative path in your synced folder.
You can avoid this if you just use an absolute Path (/Volumes/...)
```bash
config.vm.synced_folder "/Volumes/Macintosh HD/Users/your-user/Sites", "/var/www", type: 'nfs', mount_options: ['rw', 'vers=3', 'tcp', 'fsc' ,'actimeo=1']
```

## MariaDB 10.5 strict SQL mode?
We have disabled the strict SQL mode for better compatibility with older apps. You can simply enable it doing this:

```bash
vagrant ssh
sudo rm /etc/mysql/conf.d/disable_strict_mode.cnf
sudo service mysql restart
```

## Troubles with APCu?
In some cases, APCu can cause troubles. You can disable APCu using the following commands

```bash
vagrant ssh
sudo apt-get remove php-apcu
sudo service apache2 restart
```

## ioncube loader for PHP 8.0 / 8.1 / 8.2
by the date of the release the ioncube loader is not ready for PHP 8.0. We will implement this as soon if it's available.

## Todos
- Add Mailhog
- Add supervisord
- Add sendmail/postfix
- easier customizations with SSL