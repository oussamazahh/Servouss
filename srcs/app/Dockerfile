# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ozahidi <ozahidi@student.1337.ma>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/03/24 11:43:00 by ozahidi           #+#    #+#              #
#    Updated: 2025/03/26 11:59:12 by ozahidi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN	apt update -y && \
	apt upgrade -y

RUN	apt-get install -y wget

RUN apt-get install -y nginx

RUN apt-get install -y mariadb-server

RUN	apt-get install -y php \
	php-mysql \
	php-cli \
	php-mbstring \
	php-fpm \
	php-gettext

# allow user nginx to edit all files in www
RUN	chown -R www-data /var/www/* && \
	chmod -R 755 /var/www/*

# create server folder
RUN	mkdir /var/www/ft_server

#install phpmyadmin
RUN	mkdir /var/www/ft_server/phpmyadmin && \
	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
	tar -zxvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components 1 \
	-C /var/www/ft_server/phpmyadmin  && \
	rm phpMyAdmin-5.0.4-all-languages.tar.gz

#setup sqlDatabase
RUN	service mysql start && \
	mysql -u root -e "CREATE DATABASE wordpress;" && \
	mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';" && \
	mysql -u root -e "update mysql.user set plugin='mysql_native_password' where user='root';" && \
	mysql -u root -e "FLUSH PRIVILEGES;"

#install wordpress
COPY	srcs/config/wordpress.tar.gz /var/www/ft_server
RUN	cd /var/www/ft_server && \
	tar -zxvf wordpress.tar.gz && \
	rm wordpress.tar.gz

#copy files in srcs in right folders
COPY	srcs/config/phpmyadmin-config.inc.php /var/www/ft_server/phpmyadmin/config.inc.php
COPY	srcs/config/wp-config.php /var/www/ft_server/wordpress
COPY	srcs/config/nginx.conf /etc/nginx/sites-available/ft_server
COPY	srcs/config/autoindex /usr/bin

#give autoindex permission
RUN	chmod +x /usr/bin/autoindex

#configure nginx
RUN	ln -s /etc/nginx/sites-available/ft_server /etc/nginx/sites-enabled/ft_server && \
	rm -rf /etc/nginx/sites-enabled/default

# create self-signed certificate
RUN	openssl req -x509 -nodes -days 365 \
	-subj "/C=MA/ST=Tanger-Tetouan-Al Hoceima/L=Martil/O=42/OU=ozahidi/CN=localhost" -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#create server and create loop

CMD service nginx start && \
	service mysql start && \
	service php7.3-fpm start && \
	tail -f /dev/null

# expose ports

EXPOSE	80 443


