# Base image from Centos 7
FROM centos:7
# Update OS
RUN yum update -y

RUN yum install epel-release yum-utils -y

RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

RUN yum install supervisor vim -y

RUN yum install httpd -y

RUN systemctl start httpd.service

# RUN systemctl enable httpd.service




















# FROM ubuntu:14.04
#
# RUN apt-get update
#
# RUN apt-get install -y curl vim supervisor apache2
# # php5-mysql php5 libapache2-mod-php5
#
# # Add supervisor configs
# COPY ./docker/config/supervisord.conf /etc/supervisor/supervisord.conf
# COPY ./docker/config/supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
#
# # Add default apache site
# COPY ./docker/config/apache_default_site.conf /etc/apache2/sites-available/000-default.conf
#
# # Add shell scripts
# COPY ./docker/sh/apache2.sh /scripts/apache2.sh
#
# # Make scripts executable
# RUN chmod +x /scripts/apache2.sh
#
# # Enable url rewriting
# RUN a2enmod rewrite
#
# # Add Web files
# COPY ./web-app /var/www/html
#
# # CMD service apache2 start
#
# CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
