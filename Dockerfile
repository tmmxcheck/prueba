FROM php:5.4-apache
RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list
RUN apt-get -y update
RUN apt-get -y install libxslt-dev
RUN docker-php-ext-install mysql mbstring exif mysqli xsl
RUN docker-php-ext-enable mysql mbstring exif mysqli xsl
ADD ./code /var/www/html
