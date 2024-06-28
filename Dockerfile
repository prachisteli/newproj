FROM centos:latest
MAINTAINER teliprachi77@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page294/primecare.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip primecare.zip
RUN pwd
RUN ls -la
RUN cp -rvf primecare-html/* .
RUN rm -rf spering primecare.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
