FROM centos:latest
MAINTAINER rohinisbag2898@gmail.com
RUN yum install -y httpd \ 
zip\ 
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page296/spering.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip spering.zip
RUN cp -rvf spering/* .
RUN rm -rf spering spering.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
