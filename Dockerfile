# Base image from Centos 7
FROM centos:7

ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]


# Update OS
RUN yum update -y

RUN yum install epel-release yum-utils -y

RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

RUN yum install supervisor vim -y

RUN yum install httpd -y

RUN yum-config-manager --enable remi-php71

RUN yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql php-fpm -y

COPY ./docker/config/httpd.conf /etc/httpd/conf/httpd.conf

COPY ./docker/config/supervisord.conf /etc/supervisord.conf

CMD /usr/bin/supervisord -n -c /etc/supervisord.conf
